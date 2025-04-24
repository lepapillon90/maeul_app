import 'package:flutter/material.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _checkOnboarding();
  }

  Future<void> _checkOnboarding() async {
    await Future.delayed(const Duration(seconds: 3));
    final prefs = await SharedPreferences.getInstance();
    final user = FirebaseAuth.instance.currentUser;

    print('[SPLASH] FirebaseAuth.currentUser: ${user?.uid}');

    if (user == null) {
      print('[SPLASH] ➤ 이동: 온보딩 페이지 (비로그인)');
      Navigator.pushReplacementNamed(context, '/onboarding');
      return;
    }

    final isOnboarded = prefs.getBool('isOnboarded') ?? false;
    print('[SPLASH] isOnboarded: $isOnboarded');

    if (!isOnboarded) {
      print('[SPLASH] ➤ 이동: 온보딩 페이지');
      Navigator.pushReplacementNamed(context, '/onboarding');
    } else {
      print('[SPLASH] ➤ 이동: 홈');
      Navigator.pushReplacementNamed(context, '/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFAFAF3E0),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/splash_page_top.png',
              width: 200,
            ),
            const SizedBox(height: 24),
            const Text(
              '머물고 싶은 마을,\n머물며 바뀌는 나',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                color: Color(0xFF264026),
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 48),
            const CircularProgressIndicator(color: Color(0xFF8FBF67)),
            const SizedBox(height: 48),
            Image.asset(
              'assets/images/splash_page_bottom.png',
              width: 160,
            ),
          ],
        ),
      ),
    );
  }
}
