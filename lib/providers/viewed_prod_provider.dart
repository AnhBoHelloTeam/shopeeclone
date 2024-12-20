import 'package:flutter/material.dart';
import 'package:shopeeclone/models/viewed_prod_model.dart';
import 'package:uuid/uuid.dart';

class ViewedProdProvider with ChangeNotifier {
  final Map<String, ViewedProdModel> _viewedProdItems = {};

  Map<String, ViewedProdModel> get getViewedProdItems {
    return _viewedProdItems;
  }

  void addProductToHistory({required String productId}) {
    _viewedProdItems.putIfAbsent(
      productId,
      () => ViewedProdModel(
        id: const Uuid().v4(),
        productId: productId,
      ),
    );
    notifyListeners();
  }
}
