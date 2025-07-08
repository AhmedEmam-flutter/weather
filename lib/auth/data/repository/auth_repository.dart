import 'package:firebase_auth/firebase_auth.dart';
import 'package:weather/auth/data/datasource/auth_datasource.dart';

abstract class AuthRepository {
  Future<User?> login(String email, String password);
  Future<User?> register(String email, String password);
}


class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remote;

  AuthRepositoryImpl(this._remote);

  @override
  Future<User?> login(String email, String password) async {
    final cred = await _remote.signIn(email, password);
    return cred.user;
  }

  @override
  Future<User?> register(String email, String password) async {
    final cred = await _remote.signUp(email, password);
    return cred.user;
  }
}