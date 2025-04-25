import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final double width;

  const Logo({super.key, this.width = 160});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/logo.png',
      width: width,
    );
  }
}
