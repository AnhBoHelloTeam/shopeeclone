import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shopeeclone/models/user_model.dart';

class UserProvider with ChangeNotifier {
  UserModel? _userModel;
  UserModel? get userModel {
    return _userModel;
  }

  Future<UserModel?> fethUserInfo() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;
    if (user == null) {
      return null;
    }

    var uid = user.uid; 
    try { 
      final userDoc =
          await FirebaseFirestore.instance.collection("users").doc(uid).get();
      final userDocDict = userDoc.data();
      _userModel = UserModel(
        userId: userDoc.get("userId"),
        username: userDoc.get("userName"),
        userImage: userDoc.get("userImage"),
        userEmail: userDoc.get("userEmail"),
        userCart: userDocDict!.containsKey("userCart")
          ? userDoc.get("userCart")
          :[],
        userWish: userDocDict.containsKey("userWish") 
          ? userDoc.get("userWish")
          :[],
        createdAt: userDoc.get("createdAt"),
      );
      return _userModel;
    } on FirebaseAuthException catch (error) {
      throw error.message.toString();
    } catch (error) {
      rethrow;
    }
  }
}
