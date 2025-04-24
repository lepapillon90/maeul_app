class LocationService {
  Future<List<Map<String, String>>> fetchNearbyVillages() async {
    // This will be replaced by real API call
    await Future.delayed(const Duration(seconds: 1)); // Simulate network delay
    return [
      {
        'name': '증산마을',
        'image': 'https://example.com/images/jungsan.jpg',
        'description': '청년과 이웃이 함께하는 따뜻한 공동체 마을',
      },
      {
        'name': '지례마을',
        'image': 'https://example.com/images/jireh.jpg',
        'description': '산속 작은 문화예술마을',
      },
      {
        'name': '대덕마을',
        'image': 'https://example.com/images/daedeok.jpg',
        'description': '자연 속 텃밭과 힐링이 있는 마을',
      },
    ];
  }
}
