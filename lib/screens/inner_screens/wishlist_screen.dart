
import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopeeclone/providers/wishlist_provider.dart';
import 'package:shopeeclone/services/assets_manager.dart';
import 'package:shopeeclone/services/my_app_methods.dart';
import 'package:shopeeclone/widgets/empty_widget_bag.dart';
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
    final wishlistProvider = Provider.of<WishlistProvider>(context);
    return wishlistProvider.getWishlistItems.isEmpty
        ? Scaffold(
            body: EmptyBagWidget(
              imagePath: AssetsManager.shoppingBasket,
              title: "your wishlist is empty",
              subtitles: "Look like you didn't add a wishlist",
              buttonText: "Shop Now",
            ),
          )
        : Scaffold(
            appBar: AppBar(
              title: TitleTextWidget(
                  label: "Whist (${wishlistProvider.getWishlistItems.length})"),
              leading: Padding(
                padding: const EdgeInsets.all(8),
                child: Image.asset(AssetsManager.shoppingCart),
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    MyAppMethods.showErrorOrWarningDialog(
                      isError: false,
                        context: context,
                        subtite: "Remote items?",
                        ftc: () {
                          wishlistProvider.clearLocalWishlist();
                        });
                  },
                  icon: const Icon(
                    Icons.delete_forever_rounded,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
            body: DynamicHeightGridView(
              itemCount:  wishlistProvider.getWishlistItems.length,
              builder: ((context, index) {
                return  ProductWidget(
                  productId: wishlistProvider.getWishlistItems.values
                  .toList()[index]
                  .producId,
                );
              }),
              crossAxisCount: 2,
            ),
          );
  }
}
