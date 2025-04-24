import 'package:flutter/material.dart';

class NotificationOverlay extends StatelessWidget {
  const NotificationOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    print('[Overlay] Building NotificationOverlay');
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
                  '알림',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                const Text(
                  '현재 수신된 알림이 없습니다.',
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
