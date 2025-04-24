import 'package:flutter/material.dart';

class LocationDetailScreen extends StatelessWidget {
  final String villageId;

  const LocationDetailScreen({
    super.key,
    required this.villageId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('마을 상세정보'),
        backgroundColor: Color(0xFFFAF3E0),
        elevation: 0,
      ),
      body: Center(
        child: Text('마을 ID: $villageId'),
      ),
    );
  }
}
