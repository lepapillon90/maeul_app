import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginService {
  Future<bool> login({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        debugPrint('유효하지 않은 이메일 형식입니다.');
      } else if (e.code == 'user-not-found') {
        debugPrint('등록되지 않은 이메일입니다.');
      } else if (e.code == 'wrong-password') {
        debugPrint('비밀번호가 일치하지 않습니다.');
      } else {
        debugPrint('로그인 실패: ${e.message}');
      }
      return false;
    } catch (e, stackTrace) {
      debugPrint('로그인 중 예외 발생: $e');
      debugPrintStack(stackTrace: stackTrace);
      return false;
    }
  }

  Future<void> setAutoLoginEnabled(bool enabled) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('auto_login', enabled);
  }

  Future<bool> isAutoLoginEnabled() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('auto_login') ?? false;
  }
}