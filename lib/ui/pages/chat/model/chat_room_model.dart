class ChatRoomModel {
  final String id;
  final String name;
  final String lastMessage;
  final DateTime lastUpdated;

  ChatRoomModel({
    required this.id,
    required this.name,
    required this.lastMessage,
    required this.lastUpdated,
  });

  factory ChatRoomModel.fromJson(Map<String, dynamic> json) {
    return ChatRoomModel(
      id: json['id'],
      name: json['name'],
      lastMessage: json['lastMessage'],
      lastUpdated: DateTime.parse(json['lastUpdated']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'lastMessage': lastMessage,
      'lastUpdated': lastUpdated.toIso8601String(),
    };
  }
}
