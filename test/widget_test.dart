import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:maeul_app/main.dart';

void main() {
  testWidgets('App builds and displays splash screen', (WidgetTester tester) async {
    await tester.pumpWidget(const AppStart());

    // Wait for async operations to complete
    await tester.pumpAndSettle();

    // Check that the splash screen is shown (replace with actual splash widget text or key)
    expect(find.byType(MaterialApp), findsOneWidget);
    expect(find.text('MA:EUL'), findsOneWidget); // Or another identifier in your splash screen
  });
}
