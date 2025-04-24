import 'package:flutter/material.dart';

class ChatMessageBubble extends StatelessWidget {
  final String message;
  final bool isMe;

  const ChatMessageBubble({
    super.key,
    required this.message,
    required this.isMe,
  });

  @override
  Widget build(BuildContext context) {
    final bubbleColor = isMe ? const Color(0xFFB6B655) : const Color(0xFFF8EFD9);
    final alignment = isMe ? Alignment.centerRight : Alignment.centerLeft;

    return Align(
      alignment: alignment,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
        decoration: BoxDecoration(
          color: bubbleColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          message,
          style: const TextStyle(fontSize: 15),
        ),
      ),
    );
  }
}