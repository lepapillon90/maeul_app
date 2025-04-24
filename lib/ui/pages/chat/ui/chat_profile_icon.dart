import 'package:flutter/material.dart';

class ChatProfileIcon extends StatelessWidget {
  final String initials;
  final Color backgroundColor;
  final double size;

  const ChatProfileIcon({
    super.key,
    required this.initials,
    this.backgroundColor = Colors.green,
    this.size = 40,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: backgroundColor,
      radius: size / 2,
      child: Text(
        initials,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: size * 0.4,
        ),
      ),
    );
  }
}
