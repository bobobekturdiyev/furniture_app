import 'package:flutter/material.dart';

class ThemeNotifier extends ChangeNotifier {
  bool isDarkMode = false;

  toggle() {
    isDarkMode = !isDarkMode;
    notifyListeners();
  }

  ThemeMode get themeMode => isDarkMode ? ThemeMode.dark : ThemeMode.light;

  Color get cardColor => isDarkMode ? Colors.black : Colors.white;
}
