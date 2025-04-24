import 'package:flutter/material.dart';

class LoginSocialButtons extends StatelessWidget {
  const LoginSocialButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.5,
            child: ElevatedButton.icon(
              onPressed: () {
                try {
                  // TODO: Google 로그인 연동
                } catch (e, stackTrace) {
                  debugPrint('Google 로그인 중 오류 발생: $e');
                  debugPrintStack(stackTrace: stackTrace);
                }
              },
              icon: const Icon(Icons.g_mobiledata, size: 20),
              label: const Text('Google로 로그인'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                minimumSize: const Size.fromHeight(48), // Set height
                padding: const EdgeInsets.symmetric(horizontal: 16),
              ),
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.5,
            child: ElevatedButton.icon(
              onPressed: () {
                try {
                  // TODO: Apple 로그인 연동
                } catch (e, stackTrace) {
                  debugPrint('Apple 로그인 중 오류 발생: $e');
                  debugPrintStack(stackTrace: stackTrace);
                }
              },
              icon: const Icon(Icons.apple, size: 20),
              label: const Text('Apple로 로그인'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                minimumSize: const Size.fromHeight(48), // Set height
                padding: const EdgeInsets.symmetric(horizontal: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}