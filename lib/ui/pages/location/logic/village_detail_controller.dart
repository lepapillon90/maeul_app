import 'package:flutter/material.dart';

class VillageDetailController extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Map<String, String>? _villageDetail;
  Map<String, String>? get villageDetail => _villageDetail;

  Future<void> loadVillageDetail(String villageId) async {
    _isLoading = true;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 1)); // Simulate network

    _villageDetail = {
      'id': villageId,
      'name': '증산마을',
      'description': '따뜻한 공동체가 살아있는 마을입니다.',
      'image': 'https://example.com/village.jpg',
    };

    _isLoading = false;
    notifyListeners();
  }
}