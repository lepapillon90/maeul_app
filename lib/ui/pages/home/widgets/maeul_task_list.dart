import 'package:flutter/material.dart';
import 'maeul_task_card.dart';

class MaeulTaskList extends StatelessWidget {
  const MaeulTaskList({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: const [
          MaeulTaskCard(
            title: '과수원 일손 구합니다',
            date: '4월 5일 ~ 4월 20일',
            imagePath: 'assets/images/work_1.png',
          ),
          SizedBox(width: 16),
          MaeulTaskCard(
            title: '농촌 봉사활동 모집',
            date: '4월 5일 ~ 4월 20일',
            imagePath: 'assets/images/work_2.png',
          ),
        ],
      ),
    );
  }
}
