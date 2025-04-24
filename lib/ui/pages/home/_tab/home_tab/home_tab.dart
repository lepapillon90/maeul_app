import 'package:flutter/material.dart';
import 'package:maeul_app/ui/pages/home/widgets/maeul_banner.dart';
import 'package:maeul_app/ui/pages/home/widgets/maeul_letter_preview.dart';
import 'package:maeul_app/ui/pages/home/widgets/maeul_onboarding_call_to_action.dart';
import 'package:maeul_app/ui/pages/home/widgets/maeul_stay_banner.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAF3E0),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 배너
            const MaeulBanner(),
            const SizedBox(height: 24),

            // 섹션: 마을 최신소식
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                '마을 최신소식',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown,
                ),
              ),
            ),
            const SizedBox(height: 16),
            const MaeulLetterPreview(),

            // 섹션: 온보딩 추천
            const SizedBox(height: 16),
            const MaeulOnboardingCallToAction(),

            // 섹션: 스테이 배너
            const SizedBox(height: 16),
            const MaeulStayBanner(),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
