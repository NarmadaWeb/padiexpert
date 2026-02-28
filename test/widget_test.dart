// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'dart:io';

import 'package:app/main.dart';

void main() {
  testWidgets('PadiExpert app loads correctly with new multi-page UI', (WidgetTester tester) async {
    // Need to provide a mocked HTTP client so network images don't fail tests
    HttpOverrides.global = null;

    // Build our app and trigger a frame.
    await tester.pumpWidget(const PadiExpertApp());

    // Wait for the splash screen timer to finish
    await tester.pumpAndSettle(const Duration(seconds: 3));

    // Verify that the title on Home screen is present
    expect(find.text('WELCOME BACK'), findsOneWidget);
    expect(find.text('Farmer Juan'), findsOneWidget);

    // The "Diagnose" tab should exist in the bottom navigation bar
    expect(find.text('Diagnose'), findsOneWidget);

    // Tap the 'Diagnose' icon and trigger a frame.
    await tester.tap(find.text('Diagnose'));
    await tester.pumpAndSettle();

    // Verify that we are on the DiagnosePage
    expect(find.text('Symptom Selection'), findsWidgets);
    expect(find.text('Get Result'), findsOneWidget);

    // Tap the 'Map' icon and trigger a frame.
    await tester.tap(find.text('Map'));
    await tester.pumpAndSettle();

    // Verify that we are on the MapPage
    expect(find.text('Outbreak Map'), findsWidgets);
    expect(find.text('Rice Blast (88%)'), findsOneWidget);
  });
}
