import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'onboarding_page1.dart';
import 'onboarding_page2.dart';
import 'onboarding_page3.dart';

class OnboardingPageView extends StatefulWidget {
  const OnboardingPageView({super.key});

  @override
  State<OnboardingPageView> createState() => _OnboardingPageViewState();
}

class _OnboardingPageViewState extends State<OnboardingPageView> {
  final PageController _controller = PageController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        onPageChanged: (index) async {
          setState(() => _currentIndex = index);
          if (index == 2) { // last page
            final prefs = await SharedPreferences.getInstance();
            await prefs.setBool('onboarded', true);
          }
        },
        children: const [
          OnboardingPage1(),
          OnboardingPage2(),
          OnboardingPage3(),
        ],
      ),
    );
  }
}
