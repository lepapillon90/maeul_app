import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'onboarding_page3.dart';
import 'package:flutter/material.dart';
import 'package:maeul_app/core/constants/text_styles.dart';
import 'package:maeul_app/core/constants/colors.dart';
import 'package:maeul_app/core/widgets/dot_indicator.dart';
import 'package:maeul_app/core/widgets/primary_button.dart';

class OnboardingPage2 extends StatelessWidget {
  const OnboardingPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundCream,
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 16.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      DotIndicator(),
                      DotIndicator(isActive: true),
                      DotIndicator(),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        '나와 닮은 마을과\n조용히 연결되는 순간',
                        style: MaeulTextStyles.onboardingTitle,
                      ),
                      SizedBox(height: 16),
                      Text(
                        '지역의 삶, 계절의 흐름, 낯선 이웃과의 대화\n그곳에 머무는 동안, 나도 조금씩 바뀌어요.',
                        style: MaeulTextStyles.onboardingBody,
                      ),
                    ],
                  ),
                  Center(
                    child: Image.asset(
                      'assets/images/onboarding/onboarding_page2.png',
                      width: 240,
                      fit: BoxFit.contain,
                    ),
                  ),
                  PrimaryButton(
                    text: '다음',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const OnboardingPage3(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            Positioned(
              top: 16,
              right: 24,
              child: GestureDetector(
                onTap: () async {
                  final prefs = await SharedPreferences.getInstance();
                  final user = FirebaseAuth.instance.currentUser;
                  await prefs.setBool('isOnboarded', true);
                  if (user != null) {
                    Navigator.pushReplacementNamed(context, '/home');
                  } else {
                    Navigator.pushReplacementNamed(context, '/login');
                  }
                },
                child: const Text(
                  '바로 시작하기',
                  style: TextStyle(fontSize: 14, color: Color(0xFF888888)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
