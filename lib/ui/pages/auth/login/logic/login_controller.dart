import 'package:flutter/material.dart';

class LoginController extends ChangeNotifier {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isLoading = false;

  bool autoLogin = false;

  void setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  void disposeControllers() {
    emailController.dispose();
    passwordController.dispose();
  }

  void setAutoLogin(bool value) {
    autoLogin = value;
    notifyListeners();
  }
}