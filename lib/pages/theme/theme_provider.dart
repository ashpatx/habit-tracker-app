import 'package:flutter/material.dart';
import 'dark_mode.dart';
import 'light_mode.dart';

class ThemeProvider extends ChangeNotifier {
  //light mode default
  ThemeData _themeData = lightMode;

  //current theme
  ThemeData get themeData => _themeData;

  //current theme dark mode
  bool get isDarkMode => _themeData == darkMode;

  //set theme
  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  //toggle theme option
  voidtoggleTheme() {
    if (_themeData == lightMode) {
      themeData = darkMode;
    } else {
      themeData = lightMode;
    }
  }
}
