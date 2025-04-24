

import 'package:flutter/material.dart';

class MaeulTaskCard extends StatelessWidget {
  final String title;
  final String date;
  final String imagePath;

  const MaeulTaskCard({
    super.key,
    required this.title,
    required this.date,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Color(0xFFE2D4B7)),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(imagePath, height: 60),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),
          Text(
            date,
            style: const TextStyle(fontSize: 12, color: Colors.brown),
          ),
        ],
      ),
    );
  }
}