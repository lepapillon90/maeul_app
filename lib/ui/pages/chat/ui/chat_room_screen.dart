import 'package:flutter/material.dart';
import 'package:maeul_app/ui/pages/chat/ui/chat_input_field.dart';
import 'package:maeul_app/ui/pages/chat/ui/chat_message_bubble.dart';

class ChatRoomScreen extends StatelessWidget {
  const ChatRoomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final messages = [
      {'text': '내일 농사일 도우러 오실 수 있나요?', 'isMe': false, 'time': '오후 2:30'},
      {'text': '네, 가능합니다.', 'isMe': true, 'time': '오후 2:30'},
      {'text': '아침 8시에 마을회관 앞에서 만나요!', 'isMe': false, 'time': '오후 2:30'},
      {'text': '네, 그때 뵈요.', 'isMe': true, 'time': '오후 2:30'},
    ];

    final args = ModalRoute.of(context)!.settings.arguments as Map?;
    final name = args != null && args['name'] != null ? args['name'] : '대화상대';

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFAF3E0),
        elevation: 0,
        centerTitle: true,
        title: Text(name),
        actions: const [
          Padding(padding: EdgeInsets.symmetric(horizontal: 8), child: Icon(Icons.search)),
          Padding(padding: EdgeInsets.symmetric(horizontal: 8), child: Icon(Icons.more_vert)),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final msg = messages[index];
                return ChatMessageBubble(
                  message: msg['text'] as String,
                  isMe: msg['isMe'] as bool,
                );
              },
            ),
          ),
          ChatInputField(
            controller: TextEditingController(),
            onSend: () {},
          )
        ],
      ),
    );
  }
}