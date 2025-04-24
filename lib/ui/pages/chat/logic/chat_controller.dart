import 'package:flutter/material.dart';
import 'package:maeul_app/ui/pages/chat/model/chat_room_model.dart';

class ChatController extends ChangeNotifier {
  final List<ChatRoomModel> _chatRooms = [];

  List<ChatRoomModel> get chatRooms => _chatRooms;

  void addChatRoom(ChatRoomModel room) {
    _chatRooms.add(room);
    notifyListeners();
  }

  void updateChatRoom(String id, String newMessage) {
    final index = _chatRooms.indexWhere((room) => room.id == id);
    if (index != -1) {
      _chatRooms[index] = ChatRoomModel(
        id: _chatRooms[index].id,
        name: _chatRooms[index].name,
        lastMessage: newMessage,
        lastUpdated: DateTime.now(),
      );
      notifyListeners();
    }
  }

  void removeChatRoom(String id) {
    _chatRooms.removeWhere((room) => room.id == id);
    notifyListeners();
  }
}
