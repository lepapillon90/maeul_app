import 'package:flutter/material.dart';

class MaeulWeatherInfo extends StatelessWidget {
  const MaeulWeatherInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        child: Row(
          children: const [
            Icon(Icons.location_on, color: Colors.brown),
            SizedBox(width: 4),
            Text('김천 증산 증산면 · 맑음 21°', style: TextStyle(color: Colors.brown)),
          ],
        ),
      ),
    );
  }
}
