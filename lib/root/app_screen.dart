import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/auth/data/repository/auth_repository.dart';
import 'package:weather/auth/presenter/controller/cubit/auth_cubit.dart';
import 'package:weather/auth/presenter/view/splah/Splash_screen.dart';

class AppScreen extends StatelessWidget {
   final AuthRepositoryImpl authRepo;
  const AppScreen(this.authRepo, {super.key});

  @override
   Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthCubit(authRepo),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}