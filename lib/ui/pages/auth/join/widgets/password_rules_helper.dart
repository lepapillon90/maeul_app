import 'package:flutter/material.dart';

class PasswordRulesHelper extends StatelessWidget {
  const PasswordRulesHelper({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            '비밀번호 조건:',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text('- 최소 8자 이상'),
          Text('- 영문 대소문자 포함'),
          Text('- 숫자 및 특수문자 포함'),
        ],
      ),
    );
  }
}