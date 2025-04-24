import 'package:flutter/material.dart';

class JoinController extends ChangeNotifier {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool agreedToTerms = false;
  bool isLoading = false;

  void setAgreedToTerms(bool value) {
    agreedToTerms = value;
    notifyListeners();
  }

  void setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  void disposeControllers() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }
}