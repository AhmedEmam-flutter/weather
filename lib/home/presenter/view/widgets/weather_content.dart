import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/home/presenter/controller/cubit/home_cubit.dart';
import 'package:weather/home/presenter/controller/cubit/home_state.dart';
import 'package:weather/home/presenter/view/widgets/weather_info_card.dart';
import 'package:weather/home/presenter/view/widgets/weather_loaded_ui.dart';
class WeatherContent extends StatelessWidget {
  final double screenHeight;
  const WeatherContent({required this.screenHeight, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        if (state is WeatherInitial) {
          return const WeatherInfoCard(
            icon: Icons.wb_sunny_outlined,
            text: 'Search for a city to get the latest weather updates.',
          );
        } else if (state is WeatherLoading) {
          return SizedBox(
            height: screenHeight * 0.3,
            child: const Center(
              child: CircularProgressIndicator(color: Colors.white),
            ),
          );
        } else if (state is WeatherLoaded) {
          return WeatherLoadedUI(state: state);
        } else if (state is WeatherError) {
          return WeatherInfoCard(
            icon: Icons.error_outline_rounded,
            text: '❌ ${state.message}',
            isError: true,
          );
        } else {
          return const WeatherInfoCard(
            icon: Icons.help_outline,
            text: 'An unknown error occurred.',
          );
        }
      },
    );
  }
}
