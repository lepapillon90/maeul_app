import 'package:flutter/material.dart';
import 'package:maeul_app/ui/pages/splash/view_model/splash_view_model.dart';
import 'dart:async';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      SplashViewModel(context);
    });
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
