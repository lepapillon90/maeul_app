import 'package:flutter/material.dart';
import 'package:maeul_app/core/widgets/maeul_primary_button.dart';
import 'package:maeul_app/ui/pages/home/widgets/maeul_weather_info.dart';
import 'package:maeul_app/ui/pages/home/widgets/maeul_task_list.dart';

class MaeulOnboardingCallToAction extends StatelessWidget {
  const MaeulOnboardingCallToAction({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  'assets/images/onboarding/onboarding_page1.png',
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
              Positioned(
                top: 24,
                left: 24,
                child: Text(
                  '익숙한 일상에서\n잠시 벗어나볼까요?',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.brown[900],
                  ),
                ),
              ),
              Positioned(
                top: 24,
                right: 24,
                child: Icon(Icons.wb_sunny, color: Color(0xFFFFD66B), size: 32),
              ),
              Positioned(
                bottom: 40,
                left: 16,
                right: 16,
                child: MaeulPrimaryButton(text: '미을 시작하기', onPressed: () {}),
              ),
            ],
          ),
          const Text(
            '신청 가능한 일손',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          const MaeulTaskList(),
          const SizedBox(height: 16),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: Color(0xFFD0C4AB)), // 연한 갈색 테두리
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: const MaeulWeatherInfo(),
          ),
          const SizedBox(height: 48),
        ],
      ),
    );
  }
}
