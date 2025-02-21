import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/core/configs/theme/app_theme.dart';
import 'package:weather_app/presentation/home/provider/home_provider.dart';
import 'package:weather_app/presentation/splash/pages/splash_screen.dart';
import 'package:weather_app/service_locator.dart';

void main() {
  setupServiceLocator();
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => HomeProvider())],
      child: const MyApp(),
    ),
  );
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
