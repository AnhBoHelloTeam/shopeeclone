import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopeeclone/providers/cart_provider.dart';
import 'package:shopeeclone/providers/product_provider.dart';
import 'package:shopeeclone/widgets/app_name_text.dart';
import 'package:shopeeclone/widgets/products/heart_btn_widget.dart';
import 'package:shopeeclone/widgets/subtitles_text.dart';
import 'package:shopeeclone/widgets/titles_text.dart';

////
///////
/////
//gọi thông qua Named Routes -
// mở mình thì sdụng Navigator.pushNamed or Navigator.pushReplacementNamed từ màn hình khác và truyền productId làm tham số.
///// nhấn vào hình sẽ qua sản phẩm
class ProductsDetails extends StatefulWidget {
  static const routeName = "/ProductsDetails";
  const ProductsDetails({super.key});

  @override
  State<ProductsDetails> createState() => _ProductsDetailsState();
}

class _ProductsDetailsState extends State<ProductsDetails> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final productProvider = Provider.of<ProductProvider>(context);
    final productId = ModalRoute.of(context)!.settings.arguments as String;
    final getCurrentProduct = productProvider.findByProdId(productId);
    final cartProvider = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
          title: const AppNameTextWidget(
            fonsize: 20,
          ),
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {
                Navigator.canPop(context) ? Navigator.pop(context) : null;
              },
              icon: const Icon(Icons.arrow_back_ios),
            ),
          )),

      //
      ///
      /// Hiển thị chi tiết sản phẩm
      body: SingleChildScrollView(
        child: Column(
          children: [
            FancyShimmerImage(
              imageUrl: getCurrentProduct!.productImage,
              height: size.height * 0.38,
              width: double.infinity,
              boxFit: BoxFit.contain,
            ),
            //// tieeu đề sản phẩm
            const SizedBox(
              height: 15,
            ),
            /////////////////////////////////////////////////////////////////////////
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                
                    children: [
                      //co giãn một cách linh hoạt nhưng không bị ép buộc chiếm toàn bộ không gian.
                      Flexible(
                        child: Text(
                          getCurrentProduct.productTitle,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                      const SizedBox(
                        height: 25,
                      ),
                      SubtitleTextWidget(
                        label: "${getCurrentProduct.productPrice}\$",
                        color: Colors.orange,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        HeartBtnWidget(
                          productId: getCurrentProduct.productId,
                          colors: Colors.blue.shade300,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                        Expanded(
                          child: SizedBox(
                            height: kBottomNavigationBarHeight - 10,
                            child: ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.lightBlue,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              // hiệu ướng bấm vào nút
                              onPressed: () {
                                if (cartProvider.isProductInCart(
                                    ProductId: getCurrentProduct.productId)) {
                                  return;
                                }
                                cartProvider.addProductToCart(
                                  productId:getCurrentProduct.productId); 
                              },
                              icon:  Icon(
                                cartProvider.isProductInCart(
                                  ProductId:getCurrentProduct.productId)
                                ? Icons.check
                                : Icons.add_shopping_cart_rounded
                              ),
                              label: Text(
                                cartProvider.isProductInCart(
                                  ProductId: getCurrentProduct.productId)
                                ? "In cart"
                                : "Add to cart"
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
            ////////////////////////////////////////////////////////////////////

            const SizedBox(
              width: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const TitleTextWidget(label: "thông tin về sản phẩm"),
                SubtitleTextWidget(label: getCurrentProduct.productCategory),
              ],
            ),
            const SizedBox(
              width: 20,
            ),

            SubtitleTextWidget(
              label: getCurrentProduct.productDescription,
              textAlign: TextAlign.left,
            ),
          ],
        ),
      ),
    );
  }
}
