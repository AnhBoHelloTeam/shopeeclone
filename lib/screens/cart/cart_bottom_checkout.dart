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
    final cartProvider = Provider.of<CartProvider>(context);
    final productProvider = Provider.of<ProductProvider>(context);
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        border: Border(
          top: BorderSide(
            width: 1,
            color: Colors.grey,
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
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FittedBox(
                        child: TitleTextWidget(
                            label: "Tổng thanh toán (${cartProvider.getCartItems.length} Products/ ${cartProvider.getQty()} Items)")),
                    SubtitleTextWidget(
                      label: "${cartProvider.getToal(productProvider: productProvider)}\$",
                      color: Colors.orange,
                    ),
                  ],
                ),
              ),
              ElevatedButton(onPressed: () {}, child: Text("Mua Hàng"))
            ],
          ),
        ),
      ),
    );
  }
}
