import 'package:flutter/material.dart';
import 'package:maeul_app/core/constants/colors.dart';
import 'package:maeul_app/ui/pages/profile/overlay/history_overlay.dart';
import 'package:maeul_app/ui/pages/profile/overlay/missions_overlay.dart';
import 'package:maeul_app/ui/pages/profile/overlay/notification_overlay.dart';
import 'package:maeul_app/ui/pages/profile/overlay/verification_overlay.dart';
import 'package:maeul_app/ui/pages/profile/widgets/profile_header.dart';
import 'package:maeul_app/ui/pages/profile/widgets/profile_menu_tile.dart';
import 'package:maeul_app/ui/pages/profile/widgets/logout_buttons.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  void _showOverlay(BuildContext context, Widget child) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: '프로필 오버레이 닫기',
      barrierColor: Colors.black.withOpacity(0.3),
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (context, animation, secondaryAnimation) => child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 32),
            const ProfileHeader(),
            const SizedBox(height: 32),
            Expanded(
              child: ListView(
                children: [
                  ProfileMenuTile(
                    icon: Icons.notifications,
                    title: '알림',
                    onTap: () => _showOverlay(context, const NotificationOverlay()),
                  ),
                  ProfileMenuTile(
                    icon: Icons.verified_user,
                    title: '마을 인증',
                    onTap: () => _showOverlay(context, const VerificationOverlay()),
                  ),
                  ProfileMenuTile(
                    icon: Icons.flag,
                    title: '미션',
                    onTap: () => _showOverlay(context, const MissionsOverlay()),
                  ),
                  ProfileMenuTile(
                    icon: Icons.menu_book,
                    title: '활동 기록',
                    onTap: () => _showOverlay(context, const HistoryOverlay()),
                  ),
                  const SizedBox(height: 32),
                  const LogoutButtons(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
