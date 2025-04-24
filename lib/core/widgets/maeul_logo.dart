import 'package:flutter/material.dart';

class MaeulLogo extends StatelessWidget {
  final double width;

  const MaeulLogo({super.key, this.width = 160});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/logo.png',
      width: width,
    );
  }
}
