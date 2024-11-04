import 'package:flutter/material.dart';
import 'package:furniture_app/config/resources/app_colors.dart';

abstract class AppTheme {
  static ThemeData defaultTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.backgroundColor,
    inputDecorationTheme: InputDecorationTheme(
      fillColor: Colors.white,
      filled: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(13),
        borderSide: BorderSide.none,
      ),
      hintStyle: const TextStyle(
        color: Color(0xFFAAAAAA),
        fontSize: 14,
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.darkBackgroundColor,
    inputDecorationTheme: InputDecorationTheme(
      fillColor: Colors.black,
      filled: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(13),
        borderSide: BorderSide.none,
      ),
      hintStyle: const TextStyle(
        color: Color(0xFFAAAAAA),
        fontSize: 14,
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    ),
  );
}
