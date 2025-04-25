import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 48, 16, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                icon: const Icon(Icons.menu, color: Colors.brown),
                onPressed: () {
                  // TODO: Implement menu drawer or callback
                },
              ),
            ),
          ),
          Image.asset(
            'assets/images/logo.png',
            height: 20,
          ),
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(Icons.search, color: Colors.brown),
                  SizedBox(width: 12),
                  Icon(Icons.notifications_none, color: Colors.brown),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
