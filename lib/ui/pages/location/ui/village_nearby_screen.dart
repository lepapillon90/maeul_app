import 'package:flutter/material.dart';
import 'package:maeul_app/ui/pages/location/widgets/location_map_preview.dart';
import 'package:maeul_app/ui/pages/location/widgets/village_card.dart';

class VillageNearbyScreen extends StatelessWidget {
  const VillageNearbyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('근처 마을'),
        backgroundColor: Color(0xFFFAF3E0),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 12),
            const LocationMapPreview(),
            ...[
              {
                'id': 'jungsan',
                'image': 'https://example.com/village1.jpg',
                'name': '증산마을',
                'description': '청년과 이웃이 함께하는 따뜻한 공동체 마을',
              },
              {
                'id': 'jire',
                'image': 'https://example.com/village2.jpg',
                'name': '지례마을',
                'description': '산속 작은 문화예술마을',
              },
            ].map((v) => VillageCard(
                  villageId: v['id']!,
                  imageUrl: v['image']!,
                  name: v['name']!,
                  description: v['description']!,
                )),
          ],
        ),
      ),
    );
  }
}