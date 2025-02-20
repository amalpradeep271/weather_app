import 'package:flutter/material.dart';
import 'package:weather_app/core/configs/theme/app_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.primaryPurple, // Example using primary color
    scaffoldBackgroundColor: AppColors.white, // Example using white
    // Define other theme properties...
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.buttonYellow, // Example button color
        foregroundColor: Colors.black, // Text color
        textStyle: const TextStyle(fontWeight: FontWeight.bold),
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      ),
    ),
    textTheme: const TextTheme(
      headlineSmall: TextStyle(
        color: AppColors.white, // Example text color
      ),
      bodyLarge: TextStyle(color: Colors.black),
    ),
  );

  // You can define a darkTheme here if needed:
  // static ThemeData darkTheme = ...
}
