import 'package:firebase_test/core/utils/app_constants.dart';
import 'package:flutter/material.dart';

class Styles {
  static ThemeData themeData(
      {required bool isDark, required BuildContext context}) {
    return ThemeData(
      scaffoldBackgroundColor:
          isDark ? AppColors.darkScaffoldColor : AppColors.lightSCaffoldColor,
      cardColor: isDark
          ? const Color.fromARGB(255, 13, 6, 37)
          : AppColors.lightCardColor,
      brightness: isDark ? Brightness.dark : Brightness.light,
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(
          color: isDark ? Colors.white : Colors.black,
        ),
        color:
            isDark ? AppColors.darkScaffoldColor : AppColors.lightSCaffoldColor,
        elevation: 0,
        titleTextStyle: TextStyle(
          color: isDark ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}
