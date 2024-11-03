// auth_provider.dart

import 'package:flutter/material.dart';

import '../../domain/usecases/login_usecase.dart';
import '../../domain/usecases/logout_usecase.dart';

class AuthProvider with ChangeNotifier {
  final LoginUseCase loginUseCase;
  final LogoutUseCase logoutUseCase;

  bool _isLoggedIn = false;
  bool get isLoggedIn => _isLoggedIn;

  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  AuthProvider(this.loginUseCase, this.logoutUseCase);

  Future<void> login(String email, String password) async {
    final result = await loginUseCase.call(email, password);
    result.fold(
      (failure) {
        _errorMessage = "Invalid email or password";
        _isLoggedIn = false;
        notifyListeners();
      },
      (_) {
        _errorMessage = '';
        _isLoggedIn = true;
        notifyListeners();
      },
    );
  }

  Future<void> logout() async {
    final result = await logoutUseCase.call();
    result.fold(
      (failure) => print('Logout failed'),
      (_) {
        _isLoggedIn = false;
        notifyListeners();
      },
    );
  }
}
