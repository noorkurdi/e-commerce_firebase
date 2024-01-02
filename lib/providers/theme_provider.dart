import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeProvider() {
    getTheme();
  }
  bool darkTheme = false;

  static const String spThemeKey = 'theme';

  Future<void> setDarkTheme(bool isDark) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool(spThemeKey, isDark);
    darkTheme = isDark;
    log(sharedPreferences.getBool(spThemeKey).toString());
    notifyListeners();
  }

  Future<void> getTheme() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    darkTheme = sharedPreferences.getBool(spThemeKey) ?? false;
    notifyListeners();
  }
}
