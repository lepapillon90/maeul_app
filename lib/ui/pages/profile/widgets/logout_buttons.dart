import 'package:flutter/material.dart';

class LogoutButtons extends StatelessWidget {
  const LogoutButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
          onPressed: () {
            // 로그아웃 처리 로직
          },
          child: const Text(
            '로그아웃',
            style: TextStyle(
              color: Colors.brown,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            // 계정 삭제 처리 로직
          },
          child: const Text(
            '계정 삭제',
            style: TextStyle(
              color: Colors.brown,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
