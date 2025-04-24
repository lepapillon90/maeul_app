import 'package:flutter/material.dart';
import 'package:maeul_app/core/constants/colors.dart';

class MaeulPasswordField extends StatelessWidget {
  final TextEditingController controller;

  const MaeulPasswordField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: true,
      decoration: InputDecoration(
        labelText: '비밀번호',
        filled: true,
        fillColor: AppColors.inputBackground,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primary),
          borderRadius: BorderRadius.circular(8),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      ),
    );
  }
}
