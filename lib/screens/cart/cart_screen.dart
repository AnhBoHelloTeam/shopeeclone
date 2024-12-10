import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import 'package:shopeeclone/providers/cart_provider.dart';
import 'package:shopeeclone/screens/cart/cart_bottom_checkout.dart';
import 'package:shopeeclone/screens/cart/cart_widget.dart';
import 'package:shopeeclone/services/assets_manager.dart';
import 'package:shopeeclone/services/my_app_methods.dart';
import 'package:shopeeclone/widgets/empty_widget_bag.dart';
import 'package:shopeeclone/widgets/titles_text.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});
  final bool isEmpty = false;

  @override
  Widget build(BuildContext context) {
    //
    //CartProvider sẽ xử lí sản phẩm khi đã vào giỏ hàng ( link cart_provider.dart)
    //
    final cartProvider = Provider.of<CartProvider>(context);
    return cartProvider.getCartItems.isEmpty
        ? Scaffold(
            // khung EmptyBagWidget đã tạo ở file widget/empty_widget_bag.dart
            body: EmptyBagWidget(
            //assetsManager kho link chua anh
            imagePath: AssetsManager.shoppingCart,
            title: "Your cart is empty",
            subtitles:
                "Looks like your cart is empty. \nAdd something make me happy",
            buttonText: "Shop Now",
          ))
        : Scaffold(
            // khung trên cùng
            appBar: AppBar(
              actions: [
                IconButton(
                  onPressed: () {
                    MyAppMethods.showErrorOrWarningDialog(
                      isError :false,
                        context: context,
                        subtite: "Remote Items",
                        ftc: () {
                          cartProvider.clearLocalCart();
                    });
                  },
                  icon: const Icon(
                    IconlyLight.delete,
                    color: Colors.red,
                  ),
                )
              ],
              //ten appbar
              title: TitleTextWidget(
                  label: " Cart (${cartProvider.getCartItems.length})"),
              // images appbar
              leading: Image.asset(AssetsManager.shoppingCart),
            ),
            // khung trên c
            //body nayf trong scaffold THU 2
            //
            //
            // listview builder để hiển thị các item CartWidget
            // itemCount: 30 là số lượng item hiển thị
            // itemBuilder: (context, index) => const CartWidget() => để tạo item CartWidget m��i khi listview builder xem thấy 1 item.
            // listview builder s�� hiển thị 30 item CartWidget.
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cartProvider.getCartItems.length,
                    itemBuilder: (context, index) {
                      // file cart_widget.dart
                      return ChangeNotifierProvider.value(
                          value: cartProvider.getCartItems.values.toList()
                          .reversed
                          .toList()[index],
                          child: const CartWidget());
                    },
                  ),
                ),
              ],
            ),
            //file qnt_btm_widget.dart
            bottomSheet: const CartBottomCheckout(),
          );
  }
}
