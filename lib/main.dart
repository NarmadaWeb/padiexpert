import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:app/l10n/app_localizations.dart';

import 'screens/splash_screen.dart';
import 'screens/main_layout.dart';
import 'services/language_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final languageService = LanguageService();
  final initialLocale = await languageService.getLocale();
  runApp(PadiExpertApp(initialLocale: initialLocale));
}

class AppColors {
  static const primary = Color(0xFFEEC72B);
  static const backgroundLight = Color(0xFFF8F8F6);
  static const backgroundDark = Color(0xFF221E10);
  static const textLight = Color(0xFF0F172A); // slate-900
  static const textDark = Color(0xFFF1F5F9); // slate-100
}

class PadiExpertApp extends StatefulWidget {
  final Locale initialLocale;
  const PadiExpertApp({super.key, required this.initialLocale});

  static void setLocale(BuildContext context, Locale newLocale) {
    _PadiExpertAppState? state = context.findAncestorStateOfType<_PadiExpertAppState>();
    state?.setLocale(newLocale);
  }

  @override
  State<PadiExpertApp> createState() => _PadiExpertAppState();
}

class _PadiExpertAppState extends State<PadiExpertApp> {
  late Locale _locale;

  @override
  void initState() {
    super.initState();
    _locale = widget.initialLocale;
  }

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PadiExpert',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      locale: _locale,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('id'),
      ],
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
