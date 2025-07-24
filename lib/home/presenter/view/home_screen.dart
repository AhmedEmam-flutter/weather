import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/core/colors/app_colors.dart';
import 'package:weather/home/presenter/controller/cubit/home_cubit.dart';
import 'package:weather/home/presenter/controller/cubit/home_state.dart';
import 'package:weather/home/presenter/view/widgets/search_input.dart';
import 'package:weather/home/presenter/view/widgets/weather_header.dart';
import 'package:weather/home/presenter/view/widgets/weather_loaded_ui.dart'; 

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
                  colors: [
                    AppColors.primaryBlueLight,
                    AppColors.primaryBlueDark,
                  ],
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

                    BlocBuilder<WeatherCubit, WeatherState>(
                      builder: (context, state) {
                        if (state is WeatherLoading) {
                          return Center(
                            child: CircularProgressIndicator(
                              color: AppColors.white,
                            ),
                          );
                        } else if (state is WeatherLoaded) {
                          return WeatherLoadedUI(state: state);
                        } else if (state is WeatherError) {
                          return Center(
                            child: Text(
                              'Error: ${state.message}',
                              style: const TextStyle(
                                color: Colors.redAccent,
                                fontSize: 16,
                              ),
                            ),
                          );
                        } else {
                          return const SizedBox.shrink();
                        }
                      },
                    ),
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
