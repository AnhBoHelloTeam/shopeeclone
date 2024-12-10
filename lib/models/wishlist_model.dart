import 'package:flutter/material.dart';

class WishlistModel with ChangeNotifier {
  final String id;
  final String producId;

  WishlistModel({required this.id, required this.producId});
}
