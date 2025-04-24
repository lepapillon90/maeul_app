import 'package:flutter/material.dart';
import 'package:maeul_app/ui/pages/location/services/location_service.dart';

class LocationController extends ChangeNotifier {
  final LocationService _service = LocationService();

  List<Map<String, String>> _villages = [];
  List<Map<String, String>> get villages => _villages;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> loadVillages() async {
    _isLoading = true;
    notifyListeners();

    _villages = await _service.fetchNearbyVillages();

    _isLoading = false;
    notifyListeners();
  }
}