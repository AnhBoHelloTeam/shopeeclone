import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopeeclone/models/products_models.dart';
import 'package:shopeeclone/providers/viewed_prod_provider.dart';
import 'package:shopeeclone/screens/inner_screens/products_details.dart';
import 'package:shopeeclone/widgets/products/heart_btn_widget.dart';
import 'package:shopeeclone/widgets/subtitles_text.dart';

class LatesteArrivalProductsWidgets extends StatelessWidget {
  const LatesteArrivalProductsWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    // gán dữ liệu ở ProductModel vào productModel
    final productModel = Provider.of<ProductModel>(context);
    final viewedProdvider = Provider.of<ViewedProdProvider>(context);
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      //GestureDetector để lấy click on
      child: GestureDetector(
        onTap: () async {
          viewedProdvider.addProductToHistory(
              productId: productModel.productId);
          Navigator.pushNamed(context, ProductsDetails.routeName,
              arguments: productModel.productId);
        },
        // bọc row trong sizebox để làm từng git
        child: SizedBox(
          width: size.width * 0.45,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //
              Flexible(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: FancyShimmerImage(
                    //AppConstants.productImageUrl đã fix ở const/app_constants.dart
                    imageUrl: productModel.productImage,
                    width: size.width * 0.28,
                    height: size.height * 0.28,
                  ),
                ),
              ),
              ////////
              const SizedBox(
                width: 7,
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Text(
                        productModel.productTitle,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    FittedBox(
                      child: Row(
                        children: [
                          HeartBtnWidget(productId: productModel.productId),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.add_shopping_cart_rounded,
                                size: 20),
                          ),
                        ],
                      ),
                    ),
                    FittedBox(
                      child: SubtitleTextWidget(
                        label: "${productModel.productPrice}\$",
                        color: Colors.orange,
                      ),
                    )
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
