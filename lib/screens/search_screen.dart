import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import 'package:shopeeclone/models/products_models.dart';
import 'package:shopeeclone/providers/product_provider.dart';
import 'package:shopeeclone/services/assets_manager.dart';
import 'package:shopeeclone/widgets/products/product_widget.dart';
import 'package:shopeeclone/widgets/titles_text.dart';

// liên kết vs products_details và product_widget
class SearchScreen extends StatefulWidget {
  static const routeName = "/SearchScreen";
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late TextEditingController searchTextController;
  List<ProductModel> productListSearch = [];
  @override
  void initState() {
    super.initState();
    searchTextController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    String? passedCategory =
        ModalRoute.of(context)!.settings.arguments as String?;
    final List<ProductModel> productList = passedCategory == null
        ? productProvider.getProducts
        : productProvider.findByCategory(ctgName: passedCategory);

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: TitleTextWidget(label: passedCategory ?? "Search"),
          leading: Padding(
            padding: const EdgeInsets.all(8),
            child: Image.asset(AssetsManager.shoppingCart),
          ),
        ),
        body: productList.isEmpty
            ? const Center(
                child: TitleTextWidget(label: "No products found"),
              )
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    TextFormField(
                      controller: searchTextController,
                      //InputDecoration đã xử lí trong theme_data
                      decoration: InputDecoration(
                        prefixIcon: const Icon(
                          IconlyLight.search,
                        ),
                        suffix: IconButton(
                          onPressed: () {
                            setState(() {
                              searchTextController.clear();
                              FocusScope.of(context).unfocus();
                            });
                          },
                          icon: Icon(
                            IconlyLight.closeSquare,
                            color: Colors.red,
                          ),
                        ),
                      ),
                      onFieldSubmitted: (value) {
                        setState(() {
                          productListSearch = productProvider.searchQuery(
                              searchText: searchTextController.text,
                              passedList: productList);
                        });
                      },
                      onChanged: (value){
                        setState(() {
                          productListSearch = productProvider.searchQuery(
                              searchText: searchTextController.text,
                              passedList: productList);
                        });
                      },
                    ),
                    ////////////////////////////////////////////////////////////////
                   
                    if (searchTextController.text.isNotEmpty &&
                        productListSearch.isEmpty) ...[
                      const Center(
                        child: TitleTextWidget(
                          label: "no results found",
                          fontSize: 30,
                        ),
                      )
                    ],
                    Expanded(
                      child: DynamicHeightGridView(
                        builder: (context, index) {
                          final product = searchTextController.text.isEmpty
                              ? productList[index]
                              : productListSearch[index];
                          return ProductWidget(
                            productId: product.productId,
                          );
                        },
                        itemCount: searchTextController.text.isNotEmpty
                            ? productListSearch.length
                            : productList.length,
                        crossAxisCount: 2,
                      ),
                    )

                  ],
                ),
              ),
      ),
    );
  }
}
