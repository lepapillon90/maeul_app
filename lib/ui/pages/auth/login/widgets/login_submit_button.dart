import 'package:flutter/material.dart';
import 'package:maeul_app/core/widgets/maeul_primary_button.dart';

class LoginSubmitButton extends StatelessWidget {
  final VoidCallback onPressed;

  const LoginSubmitButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: MaeulPrimaryButton(
        text: '로그인',
        onPressed: () {
          try {
            onPressed();
          } catch (e, stackTrace) {
            debugPrint('LoginSubmitButton 오류: $e');
            debugPrintStack(stackTrace: stackTrace);
          }
        },
      ),
    );
  }
}