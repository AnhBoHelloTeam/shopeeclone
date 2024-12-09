import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:shopeeclone/widgets/products/product_widget.dart';
import 'package:shopeeclone/widgets/titles_text.dart';

class WishlistScreen extends StatefulWidget {
    //hien thi ra danh muc cac san pham
    static const routeName = "/WishlistScreen";

  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
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
          title: const TitleTextWidget(label: "Danh mục yêu thích"),
        ),
        body: Column(
          children: [

            ////////////////////////////////////////////////////////////////
            SizedBox(height: 20,),
            Expanded(
              child: DynamicHeightGridView(
                builder: (context, index) {
                  // tìm về widget/product_widget
                  return const ProductWidget(
                    productId: "",
                  );
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
