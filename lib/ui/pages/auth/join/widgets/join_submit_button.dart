import 'package:flutter/material.dart';
import 'package:maeul_app/core/widgets/primary_button.dart';

class JoinSubmitButton extends StatelessWidget {
  final VoidCallback onPressed;

  const JoinSubmitButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: PrimaryButton(text: '가입하기', onPressed: onPressed),
    );
  }
}
