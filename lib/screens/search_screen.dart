import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:shopeeclone/widgets/products/product_widget.dart';
import 'package:shopeeclone/widgets/titles_text.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late TextEditingController searchTextController;
  @override
  void initState() {
    super.initState();
    searchTextController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const TitleTextWidget(label: "Search Product"),
        ),
        body: Column(
          children: [
            TextFormField(
              //InputDecoration đã xử lí trong theme_data
              decoration: InputDecoration(
                prefixIcon: Icon(
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
                print(searchTextController.text);
              },
            ),
            ////////////////////////////////////////////////////////////////
            SizedBox(height: 20,),
            Expanded(
              child: DynamicHeightGridView(
                builder: (context, index) {
                  // tìm về widget/product_widget
                  return const ProductWidget();
                },
                itemCount: 30,
                crossAxisCount: 2,
              ),
            )
          ],
        ),
      ),
    );
  }
}
