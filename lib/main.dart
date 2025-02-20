import 'package:flutter/material.dart';
import 'package:weather_app/core/configs/theme/app_theme.dart';
import 'package:weather_app/presentation/splash/pages/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      theme: AppTheme.lightTheme, 
      home: SplashScreen(),
    );
  }
}
