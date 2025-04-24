import 'package:flutter/material.dart';
import 'package:maeul_app/ui/pages/profile/model/user_profile_model.dart';
import 'package:maeul_app/ui/pages/profile/services/profile_service.dart';

class ProfileController extends ChangeNotifier {
  final ProfileService _profileService = ProfileService();
  UserProfileModel? _userProfile;

  UserProfileModel? get userProfile => _userProfile;

  Future<void> loadUserProfile() async {
    final user = await _profileService.getCurrentUser();
    if (user != null) {
      final data = await _profileService.getUserProfile(user.uid);
      if (data != null) {
        _userProfile = UserProfileModel.fromMap(data, user.uid);
        notifyListeners();
      }
    }
  }

  Future<void> logout() async {
    await _profileService.logout();
  }

  Future<void> deleteAccount() async {
    await _profileService.deleteAccount();
  }
}
