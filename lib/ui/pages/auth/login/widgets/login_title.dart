import 'package:flutter/material.dart';

class LoginTitle extends StatelessWidget {
  const LoginTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Image.asset(
              'assets/images/logo.png', // adjust path as needed
              height: 50,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(Icons.error_outline, size: 64, color: Colors.redAccent);
              },
            ),
          ),
          SizedBox(height: 16),
          Center(
            child: Text(
              '개인의 이야기에서 마을의 변화로',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFF4E3E30), // updated dark brown
              ),
            ),
          ),
        ],
      ),
    );
  }
}