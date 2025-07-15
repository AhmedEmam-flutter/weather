import 'package:flutter/material.dart';
import 'package:weather/core/colors/app_colors.dart';
import 'package:weather/home/data/models/forecast_weather_model.dart';
import 'package:weather/home/presenter/controller/cubit/home_state.dart';
import 'package:weather/home/presenter/view/widgets/glassmorphic_card.dart';

class WeatherLoadedUI extends StatelessWidget {
  final WeatherLoaded state;
  const WeatherLoadedUI({required this.state, super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Column(
      children: [
        GlassmorphicCard(
          child: Column(
            children: [
              Text(
                state.current.region,
                style: TextStyle(
                  fontSize: screenWidth * 0.07,
                  color: AppColors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: screenWidth * 0.03),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    _getWeatherIcon(state.current.condition),
                    color: AppColors.white,
                    size: screenWidth * 0.18,
                  ),
                  SizedBox(width: screenWidth * 0.05),
                  Text(
                    '${state.current.temperature}°',
                    style: TextStyle(
                      fontSize: screenWidth * 0.2,
                      color: AppColors.white,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                ],
              ),
              Text(
                state.current.condition,
                style: TextStyle(
                  fontSize: screenWidth * 0.05,
                  color: AppColors.white,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 30),
        Text(
          '3-Day Forecast',
          style: TextStyle(
            fontSize: screenWidth * 0.055,
            color: AppColors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        ...state.forecast.days.map((day) => _buildForecastTile(day, screenWidth)),
      ],
    );
  }

  Widget _buildForecastTile(ForecastDay day, double screenWidth) {
    return Card(
      color: Colors.white.withOpacity(0.15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Text(
                day.date,
                style: TextStyle(
                  color: AppColors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: screenWidth * 0.04,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Icon(
                _getWeatherIcon(day.condition),
                color: AppColors.white,
                size: screenWidth * 0.06,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              flex: 3,
              child: Text(
                '${day.maxTemp}° / ${day.minTemp}°',
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: screenWidth * 0.04,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  IconData _getWeatherIcon(String condition) {
    final lowerCaseCondition = condition.toLowerCase();
    if (lowerCaseCondition.contains('sun') || lowerCaseCondition.contains('clear')) {
      return Icons.wb_sunny_rounded;
    } else if (lowerCaseCondition.contains('cloud')) {
      return Icons.cloud_rounded;
    } else if (lowerCaseCondition.contains('rain') || lowerCaseCondition.contains('drizzle')) {
      return Icons.umbrella_rounded;
    } else if (lowerCaseCondition.contains('snow')) {
      return Icons.ac_unit_rounded;
    } else if (lowerCaseCondition.contains('thunder')) {
      return Icons.flash_on_rounded;
    } else {
      return Icons.wb_cloudy_rounded;
    }
  }
}
