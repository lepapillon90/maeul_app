import 'package:flutter/material.dart';
import 'package:maeul_app/ui/pages/home/widgets/top_bar.dart';
import 'package:maeul_app/ui/pages/maeul/widgets/maeul_letter_preview.dart';
import 'package:maeul_app/ui/pages/home/widgets/selection_maeul.dart';
import 'package:maeul_app/ui/pages/home/widgets/stay_banner.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAF3E0),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 배너
            const TopBar(),
            const SizedBox(height: 24),

            // 섹션: 온보딩 추천
            const SizedBox(height: 16),
            const SelectionMaeul(),

            // 섹션: 스테이 배너
            const SizedBox(height: 16),
            const StayBanner(),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
