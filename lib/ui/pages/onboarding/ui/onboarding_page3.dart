import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:maeul_app/core/constants/text_styles.dart';
import 'package:maeul_app/core/constants/colors.dart';
import 'package:maeul_app/core/widgets/dot_indicator.dart';
import 'package:maeul_app/core/widgets/maeul_primary_button.dart';

class OnboardingPage3 extends StatelessWidget {
  const OnboardingPage3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundCream,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: const [
                  DotIndicator(),
                  DotIndicator(),
                  DotIndicator(isActive: true),
                ],
              ),
              const SizedBox(height: 32),
              Center(
                child: Image.asset(
                  'assets/images/splash_page_top.png',
                  width: 180,
                ),
              ),
              const SizedBox(height: 32),
              const Text(
                '지금, 마을에서\n새로운 여정을 시작해요.',
                style: MaeulTextStyles.onboardingTitle,
              ),
              const SizedBox(height: 16),
              const Text(
                '나의 속도에 맞춰 사는 삶,\n지금 MA:EUL과 함께 시작해보세요.',
                style: MaeulTextStyles.onboardingBody,
              ),
              const Spacer(),
              MaeulPrimaryButton(
                text: '시작하기',
                onPressed: () async {
                  final prefs = await SharedPreferences.getInstance();
                  final user = FirebaseAuth.instance.currentUser;
                  await prefs.setBool('isOnboarded', true);
                  if (user != null) {
                    Navigator.pushReplacementNamed(context, '/home');
                  } else {
                    Navigator.pushReplacementNamed(context, '/login');
                  }
                },
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
