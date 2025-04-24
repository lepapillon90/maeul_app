import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SplashViewModel {
  final BuildContext context;

  SplashViewModel(this.context) {
    _initialize();
  }

  Future<void> _initialize() async {
    try {
      await Future.delayed(const Duration(seconds: 3)); // Splash 유지 시간

      final user = await FirebaseAuth.instance.authStateChanges().first;

      if (user != null) {
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        Navigator.pushReplacementNamed(context, '/onboarding');
      }
    } catch (e, stackTrace) {
      debugPrint('SplashViewModel 초기화 오류: $e');
      debugPrintStack(stackTrace: stackTrace);
      Navigator.pushReplacementNamed(context, '/onboarding');
    }
  }
}
