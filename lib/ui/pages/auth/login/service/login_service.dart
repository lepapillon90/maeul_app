import 'package:flutter/foundation.dart';

class LoginService {
  Future<bool> login({
    required String email,
    required String password,
  }) async {
    try {
      await Future.delayed(const Duration(seconds: 2)); // simulate network delay

      // Simulate login success if email and password match expected
      return email == 'test@example.com' && password == 'password123';
    } catch (e, stackTrace) {
      debugPrint('로그인 중 예외 발생: $e');
      debugPrintStack(stackTrace: stackTrace);
      return false;
    }
  }
}