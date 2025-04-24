import 'package:flutter/material.dart';

class MissionsOverlay extends StatelessWidget {
  const MissionsOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    print('[Overlay] Building MissionsOverlay');
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Material(
          color: Colors.transparent,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 24),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.95),
              borderRadius: BorderRadius.circular(24),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: const Icon(Icons.close, size: 24, color: Colors.black54),
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  '미션 현황',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                const Text(
                  '당신의 마을살이 미션은\n곧 업데이트될 예정입니다.',
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
