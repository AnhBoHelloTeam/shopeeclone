import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopeeclone/consts/app_constants.dart';
import 'package:shopeeclone/consts/theme_data.dart';
import 'package:shopeeclone/providers/cart_provider.dart';
import 'package:shopeeclone/providers/product_provider.dart';
import 'package:shopeeclone/providers/theme_provider.dart';
import 'package:shopeeclone/providers/user_provider.dart';
import 'package:shopeeclone/providers/viewed_prod_provider.dart';
import 'package:shopeeclone/providers/wishlist_provider.dart';
import 'package:shopeeclone/root_screen.dart';
import 'package:shopeeclone/screens/auth/forgot_password.dart';
import 'package:shopeeclone/screens/auth/login.dart';
import 'package:shopeeclone/screens/auth/register.dart';
import 'package:shopeeclone/screens/inner_screens/order/orders_screen.dart';
import 'package:shopeeclone/screens/inner_screens/products_details.dart';
import 'package:shopeeclone/screens/inner_screens/viewed_recently.dart';
import 'package:shopeeclone/screens/inner_screens/wishlist_screen.dart';
import 'package:shopeeclone/screens/search_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  // biến truyền vào firebase thông số như đây (Thông tin bên app_constans)
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Firebase.initializeApp(
          options: FirebaseOptions(
            apiKey: AppConstants.apiKey,
            appId: AppConstants.appId,
            messagingSenderId: AppConstants.messagingSenderId,
            projectId: AppConstants.projectId,
          ),
        ),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (snapshot.hasError) {
            Scaffold(
              body: Center(
                child: SelectableText(
                    "An error has been occurend ${snapshot.error}"),
              ),
            );
          }

          return MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (_) {
                return ThemeProvider();
              }),
              ChangeNotifierProvider(create: (_) {
                return ProductProvider();
              }),
              ChangeNotifierProvider(create: (_) {
                return CartProvider();
              }),
              ChangeNotifierProvider(create: (_) {
                return WishlistProvider();
              }),
              ChangeNotifierProvider(create: (_) {
                return ViewedProdProvider();
              }),
              ChangeNotifierProvider(create: (_) {
                return UserProvider();
              }),
            ],
            child: Consumer<ThemeProvider>(builder: (
              context,
              themeProvider,
              child,
            ) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'BalochDev Shop ADMIN',
                theme: Styles.themeData(
                    isDarkTheme: themeProvider.getIsDarkTheme,
                    context: context),
                home: const RootScreen(),
                routes: {
                  ProductsDetails.routeName: (context) =>
                      const ProductsDetails(),
                  WishlistScreen.routeName: (context) => const WishlistScreen(),
                  RegisterScreen.routeName: (context) => const RegisterScreen(),
                  RecentlyViewedScreen.routeName: (context) =>
                      const RecentlyViewedScreen(),
                  LoginScreen.routeName: (context) => const LoginScreen(),
                  OrdersScreenFree.routeName: (context) =>
                      const OrdersScreenFree(),
                  ForgotPasswordScreen.routeName: (context) =>
                      const ForgotPasswordScreen(),
                  SearchScreen.routeName: (context) => const SearchScreen(),
                  RootScreen.routeName: (context) => const RootScreen(),
                },
              );
            }),
          );
        });
  }
}
///hello dnhan
////////////////////////////////////////////////////////////////