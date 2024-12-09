import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopeeclone/providers/cart_provider.dart';
import 'package:shopeeclone/providers/product_provider.dart';
import 'package:shopeeclone/widgets/subtitles_text.dart';
import 'package:shopeeclone/widgets/titles_text.dart';

class CartBottomCheckout extends StatelessWidget {
  const CartBottomCheckout({super.key});

  @override
  Widget build(BuildContext context) {
    //Truy cập dữ liệu từ các Provider 
    final cartProvider = Provider.of<CartProvider>(context);
    final productProvider = Provider.of<ProductProvider>(context);

    // Tạo chuỗi động
    String totalLabel = "Tổng thanh toán (${cartProvider.getCartItems.length} products/${cartProvider.getQty()} Items)";

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        border: Border(
          top: BorderSide(
            width: 1, color: Colors.grey,
          ),
        ),
      ),
      child: SizedBox(
        height: kBottomNavigationBarHeight + 20,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Loại bỏ const ở đây
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FittedBox(
                      child: TitleTextWidget(label: totalLabel), // Đảm bảo không có const ở đây
                    ),
                    SubtitleTextWidget(
                      label: 
                        "${cartProvider.getTotal(productProvider: productProvider)}", // Cần thay giá trị đúng nếu cần
                      color: Colors.orange,
                    ),
                  ],
                ),
              ),
              ElevatedButton(onPressed: () {}, child: const Text("Mua Hàng (0)"))
            ],
          ),
        ),
      ),
    );
  }
}
