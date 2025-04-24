import 'package:flutter/material.dart';

class ChatListScreen extends StatelessWidget {
  const ChatListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dummyChats = [
      {'name': '김소희', 'lastMessage': '네, 알겠습니다!', 'time': '오후 2:30'},
      {'name': '이용자님', 'lastMessage': '혹시 내일 시간 되시나요?', 'time': '오전 10:15'},
      {'name': '마을공간', 'lastMessage': '참여해주셔서 감사합니다.', 'time': '어제'},
      {'name': '박재훈', 'lastMessage': '지금 만나는 게 가능할까요?', 'time': '4월 23일'},
      {'name': 'MA:EUL STAY', 'lastMessage': '안녕하세요, MA:EUL STAY...', 'time': '4월 20일'},
    ];

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFFFAF3E0),
        elevation: 0,
        title: const Text('대화'),
        actions: const [Padding(padding: EdgeInsets.only(right: 16), child: Icon(Icons.search))],
      ),
      body: ListView.separated(
        itemCount: dummyChats.length,
        separatorBuilder: (_, __) => const Divider(),
        itemBuilder: (context, index) {
          final chat = dummyChats[index];
          return ListTile(
            leading: CircleAvatar(backgroundColor: Colors.green),
            title: Text(chat['name']!),
            subtitle: Text(chat['lastMessage']!),
            trailing: Text(chat['time']!, style: const TextStyle(fontSize: 12)),
            onTap: () {
              Navigator.pushNamed(
                context,
                '/chat-room',
                arguments: {'name': chat['name']},
              );
            },
          );
        },
      ),
    );
  }
}