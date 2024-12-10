

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopeeclone_admin_app/consts/theme_data.dart';
import 'package:shopeeclone_admin_app/providers/product_provider.dart';
import 'package:shopeeclone_admin_app/providers/theme_provider.dart';
import 'package:shopeeclone_admin_app/screens/inner_screens/dashboard_screen.dart';
import 'package:shopeeclone_admin_app/screens/inner_screens/orders/orders_screens.dart';
import 'package:shopeeclone_admin_app/screens/inner_screens/search_screen.dart';

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
          create: (_) => ThemeProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ProductProvider(),
        ),
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
              isDarkTheme: themeProvider.getIsDarkTheme, context: context),
          home: const DashboardScreen(),
          routes: {
            OrdersScreenFree.routeName: (context) => const OrdersScreenFree(),
            SearchScreen.routeName: (context) => const SearchScreen(),
          },
        );
      }),
    );
  }
}
