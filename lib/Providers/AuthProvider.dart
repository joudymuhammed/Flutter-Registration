import 'package:flutter/material.dart';
import '../Services/AuthService.dart';
import '../Models/UserModel.dart';

class AuthProvider extends ChangeNotifier {
  bool isLoading = false;
  UserModel? user;


  Future<void> handleLogin(String email, String password) async {
    if (email.isEmpty || email == null || password.isEmpty || password == null) {
      print('Email or Password cannot be empty');
      return;
    }

    isLoading = true;
    notifyListeners();

    try {
      await AuthService.login(email, password);
      user = UserModel(email: email);
      print('Login process completed');
    } catch (e) {
      print('Error handling login in AuthProvider: $e');
    }

    isLoading = false;
    notifyListeners();
  }

  Future<void> handleSignUp(String email, String password) async {
    if (email.isEmpty || email == null || password.isEmpty || password == null) {
      print('Email or Password cannot be empty');
      return;
    }

    isLoading = true;
    notifyListeners();

    try {
      await AuthService.signUp(email, password);
      user = UserModel(email: email);
      print('Sign-up process completed');
    } catch (e) {
      print('Error handling sign-up in AuthProvider: $e');
    }

    isLoading = false;
    notifyListeners();
  }
}
