import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopeeclone/consts/theme_data.dart';
import 'package:shopeeclone/providers/cart_provider.dart';
import 'package:shopeeclone/providers/product_provider.dart';
import 'package:shopeeclone/providers/theme_provider.dart';
import 'package:shopeeclone/root_screen.dart';
import 'package:shopeeclone/screens/auth/forgot_password.dart';
import 'package:shopeeclone/screens/auth/login.dart';
import 'package:shopeeclone/screens/auth/register.dart';
import 'package:shopeeclone/screens/home_page.dart';
import 'package:shopeeclone/screens/inner_screens/order/orders_screen.dart';
import 'package:shopeeclone/screens/inner_screens/products_details.dart';
import 'package:shopeeclone/screens/inner_screens/viewed_recently.dart';
import 'package:shopeeclone/screens/inner_screens/wishlist_screen.dart';
import 'package:shopeeclone/screens/search_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProductProvider(),
        ),

        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        ),

        ChangeNotifierProvider(
          create: (context) => CartProvider(),
        ),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context,themeProvider,child,) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'BalochDev Shop ADMIN',
          theme: Styles.themeData(
              isDarkTheme: themeProvider.getIsDarkTheme, context: context),
          home: const RootScreen(),
          routes: {
            ProductsDetails.routeName: (context) => const ProductsDetails(),
            WishlistScreen.routeName: (context) => const WishlistScreen(),
            RegisterScreen.routeName: (context) => const RegisterScreen(),
            RecentlyViewedScreen.routeName: (context) => const RecentlyViewedScreen(),
            LoginScreen.routeName: (context) => const LoginScreen(),
            OrdersScreenFree.routeName: (context)=> const OrdersScreenFree(),
            ForgotPasswordScreen.routeName: (context)=> const ForgotPasswordScreen(),
            SearchScreen.routeName: (context)=> const SearchScreen(),

          },
        );
      }),
    );
  }
}
///hello dnhan
////////////////////////////////////////////////////////////////