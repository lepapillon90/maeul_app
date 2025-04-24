import 'package:flutter/material.dart';
import 'package:maeul_app/ui/pages/chat/logic/message_controller.dart';

class ChatService {
  final List<MessageModel> _messages = [];

  List<MessageModel> getMessages(String roomId) {
    // In a real app, filter by roomId from backend or local DB
    return _messages;
  }

  void sendMessage(String roomId, MessageModel message) {
    _messages.add(message);
    debugPrint('Message sent to $roomId: ${message.content}');
  }

  void receiveMessage(String roomId, MessageModel message) {
    _messages.add(message);
    debugPrint('Message received from $roomId: ${message.content}');
  }
}
