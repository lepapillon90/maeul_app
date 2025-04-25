import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'onboarding_page2.dart';
import 'package:flutter/material.dart';
import 'package:maeul_app/core/constants/text_styles.dart';
import 'package:maeul_app/core/widgets/primary_button.dart';
import 'package:maeul_app/core/widgets/dot_indicator.dart';
import 'package:maeul_app/core/constants/colors.dart';

class OnboardingPage1 extends StatelessWidget {
  const OnboardingPage1({Key? key}) : super(key: key);

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
                      DotIndicator(isActive: true),
                      DotIndicator(),
                      DotIndicator(),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      SizedBox(height: 8),
                      Text(
                        '마음이 지친 날엔,\n익숙한 일상에서 잠시\n벗어나도 괜찮아요.',
                        style: MaeulTextStyles.onboardingTitle,
                      ),
                      SizedBox(height: 16),
                      Text(
                        '천천히 걷고, 조용히 머물며\n나를 위한 시간을 시작해요.',
                        style: MaeulTextStyles.onboardingBody,
                      ),
                    ],
                  ),
                  Center(
                    child: Image.asset(
                      'assets/images/onboarding/onboarding_page1.png',
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
                          builder: (_) => const OnboardingPage2(),
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
