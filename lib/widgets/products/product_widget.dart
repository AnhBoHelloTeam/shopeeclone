import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopeeclone/providers/cart_provider.dart';
import 'package:shopeeclone/providers/product_provider.dart';
import 'package:shopeeclone/screens/inner_screens/products_details.dart';
import 'package:shopeeclone/widgets/products/heart_btn_widget.dart';
import 'package:shopeeclone/widgets/subtitles_text.dart';
import 'package:shopeeclone/widgets/titles_text.dart';

// xử lý khung spham
//
//
class ProductWidget extends StatefulWidget {
  final String productId;
  const ProductWidget({super.key, required this.productId});

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final productProvider = Provider.of<ProductProvider>(context);
    final getCurrentProduct = productProvider.findByProdId(widget.productId);
    final cartProvider = Provider.of<CartProvider>(context);

    return getCurrentProduct == null
        ? SizedBox.shrink()
        : Padding(
            padding: const EdgeInsets.all(8.0),
            //
            //
            //GestureDetector thực hiện hành động chuyển trang mỗi khi nhấn vào hình
            // ở đây sẽ nhảy vào biến ProductsDetails (screens/inner_screens/products_detail.dart)
            //
            //
            child: GestureDetector(
              onTap: () async {
                await Navigator.pushNamed(
                  context,
                  ProductsDetails.routeName,
                  arguments: getCurrentProduct.productId,
                );
              },
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: FancyShimmerImage(
                      imageUrl: getCurrentProduct.productImage,
                      height: size.height * 0.22,
                      width: double.infinity,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // bọc trong Flexible cả tràn ...
                      Flexible(
                          flex: 5,
                          child: TitleTextWidget(
                            label: getCurrentProduct.productTitle,
                            maxLines: 2,
                            fontSize: 18,
                          )),
                      Flexible(flex: 2, child: HeartBtnWidget(
                        productId: getCurrentProduct.productId,
                      )),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 1),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: SubtitleTextWidget(
                            label: "${getCurrentProduct.productPrice}\$",
                            fontSize: 14,
                            color: Colors.orange,
                          ),
                        ),
                        Flexible(
                          child: Material(
                            borderRadius: BorderRadius.circular(16),
                            color: Colors.lightBlue,
                            child: InkWell(
                              splashColor: Colors.red,
                              borderRadius: BorderRadius.circular(16),
                              onTap: () {
                                if (cartProvider.isProductInCart(
                                    ProductId: getCurrentProduct.productId)) {
                                  return;
                                }
                                cartProvider.addProductToCart(productId: getCurrentProduct.productId);
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Icon(
                                  cartProvider.isProductInCart(
                                    ProductId: getCurrentProduct.productId)
                                  ? Icons.check
                                  : Icons.add_shopping_cart_rounded,
                                  size: 20,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
  }
}
