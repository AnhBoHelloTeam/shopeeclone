
import 'package:flutter/material.dart';
import 'package:shopeeclone/models/cart_model.dart';
import 'package:shopeeclone/models/products_models.dart';
import 'package:shopeeclone/providers/product_provider.dart';
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

////////////////////////////////////////////////////////////////////////////////////////////////
  // xử lí tác vụ chọn sản phẩm trong cart
  void updateQuantity({required String productId, required int quantity}) {
    _cartItems.update(
      productId,
      (item) => CartModel(
          cartId: item.cartId, productId: productId, quantity: quantity),
    );
    notifyListeners();
  }

  double getToal({required ProductProvider productProvider}) {
    double total = 0.0;
    _cartItems.forEach((key, value) {
      final ProductModel? getCurrProduct =
          productProvider.findByProdId(value.productId);
      if (getCurrProduct == null) {
        total += 0;
      } else {
        total += double.parse(getCurrProduct.productPrice) * value.quantity;
      }
    });

    return total;
  }

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  int getQty() {
    int total = 0;
    _cartItems.forEach((key, value) {
      total += value.quantity;
    });
    return total;
  }

  void removeOneItem({required String productId}) {
    _cartItems.remove(productId);
    notifyListeners();
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  void clearLocalCart() {
    _cartItems.clear();
    notifyListeners();
  }
}
