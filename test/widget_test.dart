// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

// import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:app/main.dart';

void main() {
  testWidgets('PadiExpert app loads correctly smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const PadiExpertApp());

    // Verify that the title on Home screen is present
    expect(find.text('PadiExpert'), findsWidgets);
    expect(find.text('Selamat Datang, Petani!'), findsOneWidget);

    // The "Deteksi" tab should exist in the bottom navigation bar
    expect(find.text('Deteksi'), findsOneWidget);

    // Tap the 'Deteksi' icon and trigger a frame.
    await tester.tap(find.text('Deteksi'));
    await tester.pumpAndSettle();

    // Verify that we are on the DetectionView
    expect(find.text('Deteksi Penyakit Padi'), findsWidgets);
    expect(find.text('Ambil Foto'), findsOneWidget);
  });
}
