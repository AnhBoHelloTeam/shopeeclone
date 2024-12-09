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
  //update sản phẩm
  void updateQuantity({required String productId,required int quantity}){
    _cartItems.update(
      productId, 
      (item)=>CartModel(
        cartId: item.cartId, 
        productId: productId, 
        quantity: quantity,
      ),
    );
    notifyListeners();
  }
  double getTotal({required ProductProvider productProvider}){
    double total = 0.0;
    _cartItems.forEach((key, value) {
      final ProductModel? getCurProduct =productProvider.findByProdId(value.productId);
      if (getCurProduct == null ){
        total += 0;
        total = total =0 ;
      }else{
        total += double.parse(getCurProduct.productPrice) * value.quantity;
      }
    });
    return total;
  }

  int getQty(){
    int total = 0;
    _cartItems.forEach((key, value){
      total += value.quantity;
    });
    return total;
  }
  void removeOneItem({required String productId}){
    _cartItems.remove(productId);
    notifyListeners();
  }
  void clearLocaCart(){
    _cartItems.clear();
    notifyListeners();
  }
}
