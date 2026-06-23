import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:app/main.dart';
import 'dart:io';

class MockHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  setUpAll(() {
    HttpOverrides.global = MockHttpOverrides();
  });

  testWidgets('Verify non-functional buttons are now functional', (WidgetTester tester) async {
    await tester.pumpWidget(const PadiExpertApp(initialLocale: Locale('id')));

    // Splash screen (2.5s duration)
    await tester.pumpAndSettle(const Duration(seconds: 3));

    // 1. Verify Home Page Notification Button
    final notifButton = find.byIcon(Icons.notifications_outlined);
    expect(notifButton, findsOneWidget);
    await tester.tap(notifButton);
    await tester.pumpAndSettle();
    expect(find.text('Notifikasi'), findsWidgets);
    expect(find.text('Tidak ada notifikasi baru saat ini.'), findsOneWidget);
    await tester.tap(find.text('Tutup'));
    await tester.pumpAndSettle();

    // 2. Navigate to Diagnose Page via Bottom Nav
    await tester.tap(find.text('Diagnosis'));
    await tester.pumpAndSettle();

    // 3. Verify Diagnose Page Back Button (should switch to Home tab)
    final backButton = find.byIcon(Icons.arrow_back_ios_new);
    expect(backButton, findsOneWidget);
    await tester.tap(backButton);
    await tester.pumpAndSettle();
    expect(find.text('Selamat Datang'), findsOneWidget);

    // Navigate back to Diagnose Page
    await tester.tap(find.text('Diagnosis'));
    await tester.pumpAndSettle();

    // 4. Verify Diagnose Page Library Button (should switch to Pustaka tab)
    await tester.tap(find.widgetWithText(TextButton, 'Pustaka'));
    await tester.pumpAndSettle();
    expect(find.text('Daftar Pustaka Penyakit'), findsWidgets);
  });
}
