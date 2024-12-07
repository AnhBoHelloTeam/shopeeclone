import 'package:flutter/material.dart';

import 'app_colors.dart';

class Styles {
  static ThemeData themeData({
    required bool isDarkTheme,
    required BuildContext context,
  }) {
    return ThemeData(
      scaffoldBackgroundColor: isDarkTheme
          ? AppColors.darkScaffoldColor
          : AppColors.lightScaffoldColor,
      cardColor: isDarkTheme
          ? const Color.fromARGB(255, 13, 6, 37)
          : AppColors.lightCardColor,
      brightness: isDarkTheme ? Brightness.dark : Brightness.light,

      appBarTheme: AppBarTheme(
        elevation: 0,
        backgroundColor: isDarkTheme
         ? AppColors.darkScaffoldColor
         : AppColors.lightScaffoldColor,

         titleTextStyle: TextStyle(
          // nếu nền tối thì chữu trắng và ngược lại
          color: isDarkTheme 
          ? Colors.white 
          : Colors.black
         ),

         iconTheme: IconThemeData(
          color: isDarkTheme ? Colors.white : Colors.black
         )
      )
    );
  }
}
