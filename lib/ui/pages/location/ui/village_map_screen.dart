import 'package:flutter/material.dart';

class VillageMapScreen extends StatelessWidget {
  const VillageMapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('마을 위치'),
        backgroundColor: Color(0xFFFAF3E0),
        elevation: 0,
      ),
      body: const Center(
        child: Text('여기에 전체 마을 지도가 표시됩니다.'),
      ),
    );
  }
}