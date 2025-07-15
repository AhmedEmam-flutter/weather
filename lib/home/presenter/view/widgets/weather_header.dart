import 'package:flutter/material.dart';
import 'package:weather/core/colors/app_colors.dart';

class WeatherHeader extends StatelessWidget {
  final double screenWidth;
  const WeatherHeader({required this.screenWidth, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Text(
        'Weather App',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: AppColors.white,
          fontSize: screenWidth * 0.08,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.2,
        ),
      ),
    );
  }
}
