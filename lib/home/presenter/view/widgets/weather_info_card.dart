import 'package:flutter/material.dart';
import 'package:weather/core/colors/app_colors.dart';
import 'package:weather/home/presenter/view/widgets/glassmorphic_card.dart';

class WeatherInfoCard extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool isError;

  const WeatherInfoCard({
    required this.icon,
    required this.text,
    this.isError = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GlassmorphicCard(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: isError ? AppColors.accentRed : AppColors.white, size: 64),
          const SizedBox(height: 20),
          Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(color: AppColors.white, fontSize: 18),
          ),
        ],
      ),
    );
  }
}
