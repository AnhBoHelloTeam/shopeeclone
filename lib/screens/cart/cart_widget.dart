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
    final cartProvider = Provider.of<CartProvider>(context);
    
    // Lấy sản phẩm từ CartProvider
    final getCurrentProduct = productProvider.findByProdId(cartModelProvider.productId);

    // Kích thước màn hình
    Size size = MediaQuery.of(context).size;

    return getCurrentProduct == null
        ? const SizedBox.shrink()  // Nếu không có sản phẩm, không hiển thị gì
        : FittedBox(
            child: IntrinsicWidth(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    // Ảnh sản phẩm
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: FancyShimmerImage(
                        imageUrl: getCurrentProduct.productImage,
                        height: size.height * 0.2,
                        width: size.width * 0.2,
                      ),
                    ),
                    const SizedBox(width: 10),
                    IntrinsicWidth(
                      child: Column(
                        children: [
                          // Tiêu đề và các biểu tượng
                          Row(
                            children: [
                              SizedBox(
                                width: size.width * 0.5,
                                child: TitleTextWidget(
                                  label: getCurrentProduct.productTitle,
                                  maxLines: 3,
                                ),
                              ),
                              // Xóa sản phẩm
                              Column(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      // Gọi hàm xóa sản phẩm khỏi giỏ hàng
                                      cartProvider.removeOneItem(
                                        productId: getCurrentProduct.productId,
                                      );
                                    },
                                    icon: Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                    ),
                                  ),
                                ],
                              ),
                              // Lưu vào yêu thích
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
                            ],
                          ),
                          // Chọn số lượng sản phẩm
                          Align(
                            alignment: Alignment.centerLeft,
                            child: SizedBox(
                              width: 200, // Đặt chiều rộng tùy ý
                              child: OutlinedButton.icon(
                                onPressed: () async {
                                  await showModalBottomSheet(
                                    backgroundColor:
                                        Theme.of(context).scaffoldBackgroundColor,
                                    context: context,
                                    builder: (context) {
                                      return QuantityBottomSheetWidget(
                                          cartModel: cartModelProvider);
                                    },
                                  );
                                },
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                                label: Text("Option: ${cartModelProvider.quantity} "),
                                icon: Icon(IconlyLight.arrowDownCircle),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              // Giá sản phẩm
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
                                          cartModel: cartModelProvider);
                                    },
                                  );
                                },
                                icon: Icon(IconlyLight.buy),
                                label: Text("Đã bán 19.8K"),
                              ),
                            ],
                          ),
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
