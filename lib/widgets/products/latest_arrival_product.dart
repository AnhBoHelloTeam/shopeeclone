import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:shopeeclone/consts/app_constants.dart';
import 'package:shopeeclone/screens/inner_screens/products_details.dart';
import 'package:shopeeclone/widgets/products/product_widget.dart';
import 'package:shopeeclone/widgets/subtitles_text.dart';

class LatesteArrivalProductsWidgets extends StatelessWidget {
  const LatesteArrivalProductsWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      //GestureDetector để lấy click on
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, ProductsDetails.routeName);
        },
        // bọc row trong sizebox để làm từng git
        child: SizedBox(
          width: size.width * 0.4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //
              Flexible(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: FancyShimmerImage(
                    //AppConstants.productImageUrl đã fix ở const/app_constants.dart
                    imageUrl: AppConstants.productImageUrl,
                    width: size.width * 0.25,
                    height: size.height * 0.25,
                  ),
                ),
              ),
              ////////
              const SizedBox(
                width: 15,
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible (
                      child: Text(
                        "Title" * 5,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    FittedBox(
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: () {}, icon: Icon(IconlyLight.heart)),
                          IconButton(
                            onPressed: () {},
                            icon:
                                Icon(Icons.add_shopping_cart_rounded, size: 20),
                          ),
                        ],
                      ),
                    ),

                    ////////////////////////////////////////////////////////////////
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
