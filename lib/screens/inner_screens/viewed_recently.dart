import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:shopeeclone/widgets/products/product_widget.dart';
import 'package:shopeeclone/widgets/titles_text.dart';

class RecentlyViewedScreen extends StatelessWidget {
  static const routeName = '/RecentlyViewedScreen';
  const RecentlyViewedScreen({super.key});
final bool isEmpty = false;
 
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
                  return const ProductWidget(productId: "",);
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