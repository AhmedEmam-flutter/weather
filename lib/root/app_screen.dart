import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/auth/data/repository/auth_repository.dart';
import 'package:weather/auth/presenter/controller/cubit/auth_cubit.dart';
import 'package:weather/auth/presenter/view/splah/Splash_screen.dart';
import 'package:weather/home/data/datasource/weather_api_services.dart';
import 'package:weather/home/data/repository/weather_repository_impl.dart';
import 'package:weather/home/presenter/controller/cubit/home_cubit.dart';

class AppScreen extends StatelessWidget {
  final AuthRepositoryImpl authRepo;

  const AppScreen(this.authRepo, {super.key});

  @override
  Widget build(BuildContext context) {
    final apiService = WeatherApiService();
    final repository = WeatherRepositoryImpl(apiService);

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit(authRepo)),
        BlocProvider(create: (_) => WeatherCubit(repository)),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}