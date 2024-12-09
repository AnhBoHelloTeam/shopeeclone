import 'package:flutter/material.dart';

class ProductModel with ChangeNotifier {
  final String productId,
      productTitle,
      productPrice,
      productCategory,
      productDescription,
      productImage;
  String productQuantity; // Không phải final để có thể cập nhật

  ProductModel({
    required this.productId,
    required this.productTitle,
    required this.productPrice,
    required this.productCategory,
    required this.productDescription,
    required this.productImage,
    required this.productQuantity,
  });

  // Phương thức cập nhật số lượng sản phẩm
  void updateQuantity(String newQuantity) {
    productQuantity = newQuantity;
    notifyListeners(); // Thông báo cho các listeners
  }
}
