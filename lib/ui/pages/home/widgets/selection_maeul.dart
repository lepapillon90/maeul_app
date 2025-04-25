import 'package:flutter/material.dart';
import 'package:maeul_app/core/widgets/primary_button.dart';
import 'package:maeul_app/ui/pages/maeul/widgets/maeul_weather_info.dart';
import 'package:maeul_app/ui/pages/maeul/widgets/maeul_task_list.dart';

class SelectionMaeul extends StatelessWidget {
  const SelectionMaeul({super.key});

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
                child: PrimaryButton(text: '미을 선택하기', onPressed: () {}),
              ),
            ],
          ),
          
        ],
      ),
    );
  }
}
