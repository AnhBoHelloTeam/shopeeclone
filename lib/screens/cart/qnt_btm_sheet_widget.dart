import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopeeclone/models/cart_model.dart';
import 'package:shopeeclone/providers/cart_provider.dart';
import 'package:shopeeclone/widgets/subtitles_text.dart';

// qly số lượng sản phẩm
class QuantityBottomSheetWidget extends StatelessWidget {
  final CartModel cartModel;

  const QuantityBottomSheetWidget({super.key, required this.cartModel});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    return Column(
      children: [
        const SizedBox(height: 2),
        Container(
          height: 6,
          width: 15,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: 30,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  cartProvider.updateQuantity(
                    productId: cartModel.productId,
                    quantity: index + 1,
                  );
                  Navigator.pop(context);
                },
                child: Center(
                  child: SubtitleTextWidget(
                    label: "${index + 1}",
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
