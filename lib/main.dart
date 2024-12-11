import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart'; // Tự động tạo qua Firebase CLI
import 'package:flutter/material.dart';
import 'login_screen.dart'; // File màn hình đăng nhập

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Firebase Auth',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: LoginScreen(), // Màn hình đăng nhập
    );
  }
}
