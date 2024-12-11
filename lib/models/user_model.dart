import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserModel with ChangeNotifier {
  final String userId, username, userImage, userEmail;
  final Timestamp createdAt;
  final List userCart, userWish;

  UserModel({
     required this.userId,
    required this.username,
    required this.userImage,
    required this.userEmail,
    required this.createdAt,
    required this.userCart,
    required this.userWish,
  });
}
