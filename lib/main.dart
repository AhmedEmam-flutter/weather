import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:weather/auth/data/datasource/auth_datasource.dart';
import 'package:weather/auth/data/repository/auth_repository.dart';
import 'package:weather/firebase_options.dart';

import 'package:weather/root/app_screen.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final authRemote = FirebaseAuthRemoteDataSource(FirebaseAuth.instance);
  final authRepo   = AuthRepositoryImpl(authRemote);

  runApp(AppScreen(authRepo));
}
