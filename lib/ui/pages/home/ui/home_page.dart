import 'package:flutter/material.dart';
import 'package:maeul_app/core/widgets/bottom_nav_bar.dart';
import 'package:maeul_app/ui/pages/home/_tab/chat_tab/chat_tab.dart';
import 'package:maeul_app/ui/pages/home/_tab/home_tab/home_tab.dart';
import 'package:maeul_app/ui/pages/home/_tab/location_tab/location_tab.dart';
import 'package:maeul_app/ui/pages/home/_tab/profile_tab/profile_tab.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _tabs = const [
    HomeTab(),
    ChatTab(),
    LocationTab(),
    ProfileTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAF3E0),
      body: _tabs[_currentIndex],
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
