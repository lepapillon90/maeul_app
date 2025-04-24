import 'package:flutter/material.dart';
import 'package:maeul_app/core/constants/text_styles.dart';
import 'package:maeul_app/core/widgets/maeul_text_field.dart';

class MaeulSocialButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Widget icon;
  final Color backgroundColor;
  final Color textColor;
  final Color? borderColor;

  const MaeulSocialButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.icon,
    required this.backgroundColor,
    required this.textColor,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        minimumSize: const Size.fromHeight(50),
        side: borderColor != null ? BorderSide(color: borderColor!) : BorderSide.none,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      icon: icon,
      label: Text(
        text,
        style: MaeulTextStyles.button.copyWith(color: textColor),
      ),
    );
  }
}