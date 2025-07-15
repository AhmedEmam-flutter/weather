import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather/core/colors/app_colors.dart';
import 'package:weather/home/presenter/view/widgets/search_input.dart';
import 'package:weather/home/presenter/view/widgets/weather_content.dart';
import 'package:weather/home/presenter/view/widgets/weather_header.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final TextEditingController regionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppColors.primaryBlueLight, AppColors.primaryBlueDark],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
            SafeArea(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: screenHeight * 0.04),
                    WeatherHeader(screenWidth: screenWidth),
                    SearchInput(controller: regionController),
                    SizedBox(height: screenHeight * 0.03),
                    WeatherContent(screenHeight: screenHeight),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
