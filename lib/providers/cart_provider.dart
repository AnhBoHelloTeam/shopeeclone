import 'package:flutter/material.dart';
import 'package:shopeeclone/models/cart_model.dart';
import 'package:uuid/uuid.dart';

class CartProvider with ChangeNotifier {
  final Map<String, CartModel> _cartItems = {};

  Map<String, CartModel> get getCartItems {
    return _cartItems;
  }

////////////////////////////////////////////////////////////////////////
/////Dungf cho cart_Screen
  bool isProductInCart({required String ProductId}) {
    return _cartItems.containsKey(ProductId);
  }

////////////////////////////////////////////////////////////////
  void addProductToCart({required String productId}) {
    _cartItems.putIfAbsent(
        productId,
        () => CartModel(
            cartId: const Uuid().v4(), productId: productId, quantity: 1));

    notifyListeners();
  }
}
