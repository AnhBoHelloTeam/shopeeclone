import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import 'package:shopeeclone/consts/app_constants.dart';
import 'package:shopeeclone/models/cart_model.dart';
import 'package:shopeeclone/providers/cart_provider.dart';
import 'package:shopeeclone/providers/product_provider.dart';
import 'package:shopeeclone/screens/cart/qnt_btm_sheet_widget.dart';
import 'package:shopeeclone/widgets/subtitles_text.dart';
import 'package:shopeeclone/widgets/titles_text.dart';

class CartWidget extends StatelessWidget {
  const CartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cartModelProvider = Provider.of<CartModel>(context);

    final productProvider = Provider.of<ProductProvider>(context);
    final getCurrentProduct =
        productProvider.findByProdId(cartModelProvider.productId);

    // kicsh thuoc man hinh
    Size size = MediaQuery.of(context).size;
    final cartProvider = Provider.of<CartProvider>(context);
    return getCurrentProduct == null
        ? const SizedBox.shrink()
        : FittedBox(
            child: IntrinsicWidth(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: FancyShimmerImage(
                        // AppConstants.productImageUrl tại consts/appConstants
                        imageUrl: getCurrentProduct.productImage,
                        height: size.height * 0.25,
                        width: size.width * 0.4,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    IntrinsicWidth(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: size.width * 0.5,
                                child: TitleTextWidget(
                                  label: getCurrentProduct.productTitle,
                                  maxLines: 3,
                                ),
                              ),
                              ////////////////////////////////
                              Column(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      cartProvider.removeOneItem(
                                          productId:
                                              getCurrentProduct.productId);
                                    },
                                    icon: Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                    ),
                                  ),
                                ],
                              ),
                              ////////////////////////////////
                              Column(
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      IconlyLight.heart,
                                      color: Colors.red,
                                    ),
                                  ),
                                ],
                              ),
                              ////////////////////////////////
                            ],
                          ),
                          // lit chọn sản phẩm (mở ra loạt lựa chọn)
                          Align(
                            alignment: Alignment.centerLeft,
                            child: SizedBox(
                              width: 200, // Đặt chiều rộng tùy ý
                              child: OutlinedButton.icon(
                                onPressed: () async {
                                  await showModalBottomSheet(
                                    backgroundColor: Theme.of(context)
                                        .scaffoldBackgroundColor,
                                    context: context,
                                    builder: (context) {
                                      return QuantityBottomSheetWidget(
                                        cartModel: cartModelProvider,
                                      );
                                    },
                                  );
                                },
                                style: ButtonStyle(
                                  shape: WidgetStateProperty.all(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          8), // Bo góc nhẹ (8px)
                                    ),
                                  ),
                                ),
                                label: Text(
                                    "Option: ${cartModelProvider.quantity} "),
                                icon: Icon(IconlyLight.arrowDownCircle),
                              ),
                            ),
                          ),

                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              SubtitleTextWidget(
                                label: "${getCurrentProduct.productPrice}\$",
                                fontSize: 20,
                                color: Colors.orange,
                              ),
                              const Spacer(),
                              OutlinedButton.icon(
                                onPressed: () async {
                                  await showModalBottomSheet(
                                    context: context,
                                    builder: (context) {
                                      return QuantityBottomSheetWidget(
                                        cartModel: cartModelProvider,
                                      );
                                    },
                                  );
                                },
                                icon: Icon(IconlyLight.buy),
                                label: Text("Đã bán 19.8K"),
                              ),
                            ],
                          )
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
