import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'screens/splash_screen.dart';
import 'screens/main_layout.dart';

void main() {
  runApp(const PadiExpertApp());
}

class AppColors {
  static const primary = Color(0xFFEEC72B);
  static const backgroundLight = Color(0xFFF8F8F6);
  static const backgroundDark = Color(0xFF221E10);
  static const textLight = Color(0xFF0F172A); // slate-900
  static const textDark = Color(0xFFF1F5F9); // slate-100
}

class PadiExpertApp extends StatelessWidget {
  const PadiExpertApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PadiExpert',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: AppColors.primary,
        scaffoldBackgroundColor: AppColors.backgroundLight,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary,
          brightness: Brightness.light,
          primary: AppColors.primary,
          surface: AppColors.backgroundLight,
        ),
        textTheme: GoogleFonts.spaceGroteskTextTheme(
          ThemeData.light().textTheme,
        ),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: AppColors.primary,
        scaffoldBackgroundColor: AppColors.backgroundDark,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary,
          brightness: Brightness.dark,
          primary: AppColors.primary,
          surface: AppColors.backgroundDark,
        ),
        textTheme: GoogleFonts.spaceGroteskTextTheme(
          ThemeData.dark().textTheme,
        ),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/home': (context) => const MainLayout(initialIndex: 0),
        '/diagnose': (context) => const MainLayout(initialIndex: 1),
        '/pustaka': (context) => const MainLayout(initialIndex: 2),
        '/profile': (context) => const MainLayout(initialIndex: 3),
      },
    );
  }
}
