import 'package:flutter/material.dart';
import 'package:weather_app/core/configs/theme/app_colors.dart';
import 'package:weather_app/core/configs/theme/app_text_styles.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppColors.primaryPurple, AppColors.secondaryPurple],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/cloud_weather.png'),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Weather\n',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 27,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: 'ForeCasts',
                      style: TextStyle(
                        color: Colors.yellow,
                        fontSize: 24, // You could make this different if needed
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 25),
              ElevatedButton(
                 onPressed: () {}, child: Text('Get Started')),
            ],
          ),
        ),
      ),
    );
  }
}
