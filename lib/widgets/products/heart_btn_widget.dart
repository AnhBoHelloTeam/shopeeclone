import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import 'package:shopeeclone/providers/wishlist_provider.dart';

class HeartBtnWidget extends StatefulWidget {
  final double size;
  final String productId;
  final Color colors;
  const HeartBtnWidget(
      {super.key,
      this.size = 22,
      this.colors = Colors.white10,
      required this.productId});

  @override
  State<HeartBtnWidget> createState() => _HeartBtnWidgetState();
}

class _HeartBtnWidgetState extends State<HeartBtnWidget> {
  @override
  Widget build(BuildContext context) {
    final wishlistProvider = Provider.of<WishlistProvider>(context);
    return Container(
      decoration: BoxDecoration(shape: BoxShape.circle, color: widget.colors),
      child: IconButton(
        style: IconButton.styleFrom(
          shape: const CircleBorder(),
        ),
        onPressed: () {
          wishlistProvider.addOrRemoveFromWishlist(productId: widget.productId);
        },
        icon: Icon(
          wishlistProvider.isProductInWishlist(
            productId: widget.productId)
            ? IconlyBold.heart
            : IconlyLight.heart,
          size: widget.size,
          color: wishlistProvider.isProductInWishlist(productId: widget.productId)
          ? Colors.red
          : Colors.grey
        ),
      ),
    );
  }
}