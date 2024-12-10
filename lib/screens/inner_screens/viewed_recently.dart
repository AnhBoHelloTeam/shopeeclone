import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopeeclone/providers/viewed_prod_provider.dart';
import 'package:shopeeclone/services/assets_manager.dart';
import 'package:shopeeclone/widgets/empty_widget_bag.dart';
import 'package:shopeeclone/widgets/products/product_widget.dart';
import 'package:shopeeclone/widgets/titles_text.dart';

class RecentlyViewedScreen extends StatelessWidget {
  static const routeName = '/RecentlyViewedScreen';
  const RecentlyViewedScreen({super.key});
  final bool isEmpty = false;

  @override
  Widget build(BuildContext context) {
    final viewedProdProvider = Provider.of<ViewedProdProvider>(context);
    return viewedProdProvider.getViewedProdItems.isEmpty
    ? Scaffold(
      body: EmptyBagWidget(
        imagePath: AssetsManager.shoppingCart,
        title: "Your Viewed recently is empty",
        subtitles: "Look like you didn't add a wishlist",
        buttonText: "Shop Now",
      ),
    )
  : Scaffold(
    appBar: AppBar(
      title: TitleTextWidget(label: "recently Viewed (${viewedProdProvider.getViewedProdItems.length})"),
      leading: Padding(
        padding: const EdgeInsets.all(8),
        child: Image.asset(AssetsManager.shoppingCart),
      ),
      actions: [
        IconButton(
          onPressed: (){},
          icon: const Icon(
            Icons.delete_forever_rounded,
            color: Colors.red,
          ),
        ),
      ],
    ),
            body: DynamicHeightGridView(
              itemCount:viewedProdProvider.getViewedProdItems.length ,
              builder: ((context, index) {
                return  ProductWidget(
                  productId: viewedProdProvider.getViewedProdItems.values
                  .toList()[index]
                  .productId,
                );
              }),
              crossAxisCount: 2,
            ),
          );
  }
}