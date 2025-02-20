import 'package:flutter/material.dart';
import 'package:weather_app/core/configs/theme/app_colors.dart';

class AppTextStyles {
  static const TextStyle headline = TextStyle(
    fontSize: 24, // Adjust as needed
    fontWeight: FontWeight.bold,
    color: AppColors.white, // Or a color from your palette
  );

  static const TextStyle buttonText = TextStyle(
    fontSize: 16, // Adjust as needed
    fontWeight: FontWeight.bold,
    color: Colors.black, // Or a color from your palette
  );

  // Add more styles as needed (body text, subtitles, etc.)
  static const TextStyle body = TextStyle(
    fontSize: 14,
    color: Colors.black,
  );
}