import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/core/colors/app_colors.dart';
import 'package:weather/home/presenter/controller/cubit/home_cubit.dart';

class SearchInput extends StatelessWidget {
  final TextEditingController controller;
  const SearchInput({required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          controller: controller,
          style: TextStyle(color: AppColors.white, fontSize: screenWidth * 0.04),
          cursorColor: AppColors.white,
          decoration: InputDecoration(
            hintText: 'Enter a City',
            hintStyle: TextStyle(color: AppColors.white.withOpacity(0.7)),
            prefixIcon: Icon(Icons.search, color: AppColors.white.withOpacity(0.7)),
            filled: true,
            fillColor: Colors.white.withOpacity(0.1),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        SizedBox(height: screenWidth * 0.05),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.white,
            padding: EdgeInsets.symmetric(vertical: screenWidth * 0.04),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          ),
          onPressed: () {
            FocusScope.of(context).unfocus();
            final region = controller.text.trim();
            if (region.isNotEmpty) {
              context.read<WeatherCubit>().fetchWeather(region);
            }
          },
          child: Text(
            'GET WEATHER',
            style: TextStyle(
              color: AppColors.primaryBlueDark,
              fontSize: screenWidth * 0.045,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
