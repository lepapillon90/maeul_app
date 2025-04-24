import 'package:flutter/material.dart';

class MessageController extends ChangeNotifier {
  final List<MessageModel> _messages = [];

  List<MessageModel> get messages => _messages;

  void sendMessage(String content) {
    if (content.trim().isEmpty) return;

    final message = MessageModel(
      content: content,
      sender: 'me',
      timestamp: DateTime.now(),
    );

    _messages.add(message);
    notifyListeners();
  }

  void receiveMessage(String content) {
    final message = MessageModel(
      content: content,
      sender: 'them',
      timestamp: DateTime.now(),
    );

    _messages.add(message);
    notifyListeners();
  }
}

class MessageModel {
  final String content;
  final String sender;
  final DateTime timestamp;

  MessageModel({
    required this.content,
    required this.sender,
    required this.timestamp,
  });
}
