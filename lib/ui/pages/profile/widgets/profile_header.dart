import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundImage: AssetImage('assets/images/profile/default_profile.png'),
        ),
        const SizedBox(height: 12),
        const Text(
          '홍길동',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.brown,
          ),
        ),
        const SizedBox(height: 4),
        const Text(
          'Lv. 3 | 150 XP',
          style: TextStyle(
            color: Colors.brown,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          width: 160,
          height: 6,
          decoration: BoxDecoration(
            color: Colors.brown.withOpacity(0.2),
            borderRadius: BorderRadius.circular(4),
          ),
          child: FractionallySizedBox(
            alignment: Alignment.centerLeft,
            widthFactor: 0.6, // 예시 XP 진행도
            child: Container(
              decoration: BoxDecoration(
                color: Colors.brown,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
