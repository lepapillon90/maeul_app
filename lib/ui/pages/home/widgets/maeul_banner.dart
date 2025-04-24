import 'package:flutter/material.dart';

class MaeulBanner extends StatelessWidget {
  const MaeulBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 48, 16, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xFFF2EAD2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: const [
                Text('경북 김천', style: TextStyle(fontWeight: FontWeight.bold)),
                Icon(Icons.arrow_drop_down),
              ],
            ),
          ),
          Row(
            children: const [
              Icon(Icons.search, color: Colors.brown),
              SizedBox(width: 12),
              Icon(Icons.notifications_none, color: Colors.brown),
            ],
          ),
        ],
      ),
    );
  }
}
