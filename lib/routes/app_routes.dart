import 'package:flutter/material.dart';


// Auth Pages
import 'package:maeul_app/ui/pages/auth/login/ui/login_page.dart';
import 'package:maeul_app/ui/pages/auth/join/ui/join_page.dart';

// Onboarding & Splash
import 'package:maeul_app/ui/pages/splash/ui/splash_page.dart';
import 'package:maeul_app/ui/pages/onboarding/ui/onboarding_page_view.dart';

// Main App
import 'package:maeul_app/ui/pages/home/ui/home_page.dart';
import 'package:maeul_app/ui/pages/chat/ui/chat_room_screen.dart';
import 'package:maeul_app/ui/pages/location/ui/location_detail_screen.dart';
import 'package:maeul_app/ui/pages/location/ui/village_map_screen.dart';

class AppRoutes {
  static const splash = '/';
  static const onboarding = '/onboarding';
  static const login = '/login';
  static const home = '/home';
  static const join = '/join';
  static const chatRoom = '/chat-room';
  static const villageDetail = '/village-detail';
  static const locationMap = '/location/map';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // Splash
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashPage());

      // Onboarding
      case onboarding:
        return MaterialPageRoute(builder: (_) => const OnboardingPageView());

      // Auth
      case login:
        return MaterialPageRoute(builder: (_) => const LoginPage());

      case join:
        return MaterialPageRoute(builder: (_) => const JoinPage());

      // Main
      case home:
        return MaterialPageRoute(builder: (_) => const HomePage());

      // Chat
      case chatRoom:
        return MaterialPageRoute(builder: (_) => const ChatRoomScreen());

      // Location Detail
      case villageDetail:
        final args = settings.arguments as Map?;
        final villageId = args?['villageId'] ?? '';
        return MaterialPageRoute(
          builder: (_) => LocationDetailScreen(villageId: villageId),
        );

      // Location Map
      case locationMap:
        return MaterialPageRoute(builder: (_) => const VillageMapScreen());

      // Fallback
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('404 - Page Not Found')),
          ),
        );
    }
  }
}