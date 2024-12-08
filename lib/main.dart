import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopeeclone/consts/theme_data.dart';
import 'package:shopeeclone/providers/theme_provider.dart';
import 'package:shopeeclone/root_screen.dart';
import 'package:shopeeclone/screens/home_page.dart';
import 'package:shopeeclone/screens/inner_screens/products_details.dart';

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
          create: (context) => ThemeProvider(),
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
          },
        );
      }),
    );
  }
}
///hello duc
////////////////////////////////////////////////////////////////