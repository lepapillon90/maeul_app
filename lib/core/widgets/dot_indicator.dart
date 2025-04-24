import 'package:flutter/material.dart';
import 'package:maeul_app/core/constants/colors.dart';

class DotIndicator extends StatelessWidget {
  final bool isActive;
  const DotIndicator({this.isActive = false, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      width: 8,
      height: 8,
      decoration: BoxDecoration(
        color: isActive ? AppColors.dotActive : AppColors.dotInactive,
        shape: BoxShape.circle,
      ),
    );
  }
}
