import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_id.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('id'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'PadiExpert'**
  String get appTitle;

  /// No description provided for @welcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome'**
  String get welcome;

  /// No description provided for @protectHarvest.
  ///
  /// In en, this message translates to:
  /// **'Protect Your Harvest'**
  String get protectHarvest;

  /// No description provided for @optimizedForToday.
  ///
  /// In en, this message translates to:
  /// **'Optimized for today\'s diagnosis'**
  String get optimizedForToday;

  /// No description provided for @quickActions.
  ///
  /// In en, this message translates to:
  /// **'Quick Actions'**
  String get quickActions;

  /// No description provided for @startDiagnosis.
  ///
  /// In en, this message translates to:
  /// **'Start Diagnosis'**
  String get startDiagnosis;

  /// No description provided for @detectionSupportedByCF.
  ///
  /// In en, this message translates to:
  /// **'Detection supported by Certainty Factor'**
  String get detectionSupportedByCF;

  /// No description provided for @weatherCalendar.
  ///
  /// In en, this message translates to:
  /// **'Weather & Calendar'**
  String get weatherCalendar;

  /// No description provided for @weatherAlertOptimalPlanting.
  ///
  /// In en, this message translates to:
  /// **'Weather alerts & optimal planting'**
  String get weatherAlertOptimalPlanting;

  /// No description provided for @diagnosisHistory.
  ///
  /// In en, this message translates to:
  /// **'Diagnosis History'**
  String get diagnosisHistory;

  /// No description provided for @noDiagnosisHistory.
  ///
  /// In en, this message translates to:
  /// **'No diagnosis history yet'**
  String get noDiagnosisHistory;

  /// No description provided for @detectedDisease.
  ///
  /// In en, this message translates to:
  /// **'Detected Disease'**
  String get detectedDisease;

  /// No description provided for @certaintyLevel.
  ///
  /// In en, this message translates to:
  /// **'Certainty Level'**
  String get certaintyLevel;

  /// No description provided for @date.
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get date;

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @diagnosis.
  ///
  /// In en, this message translates to:
  /// **'Diagnosis'**
  String get diagnosis;

  /// No description provided for @library.
  ///
  /// In en, this message translates to:
  /// **'Library'**
  String get library;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @pilihanGejala.
  ///
  /// In en, this message translates to:
  /// **'Symptom Options'**
  String get pilihanGejala;

  /// No description provided for @diagnosaPenyakit.
  ///
  /// In en, this message translates to:
  /// **'Disease Diagnosis'**
  String get diagnosaPenyakit;

  /// No description provided for @identifikasiGejala.
  ///
  /// In en, this message translates to:
  /// **'Identify symptoms and determine your certainty level (Certainty Factor).'**
  String get identifikasiGejala;

  /// No description provided for @dapatkanHasil.
  ///
  /// In en, this message translates to:
  /// **'Get Results'**
  String get dapatkanHasil;

  /// No description provided for @hasilDiagnosis.
  ///
  /// In en, this message translates to:
  /// **'Diagnosis Results'**
  String get hasilDiagnosis;

  /// No description provided for @tidakAdaGejala.
  ///
  /// In en, this message translates to:
  /// **'No symptoms selected or recognized.'**
  String get tidakAdaGejala;

  /// No description provided for @caraPenanganan.
  ///
  /// In en, this message translates to:
  /// **'Treatment:'**
  String get caraPenanganan;

  /// No description provided for @caraPencegahan.
  ///
  /// In en, this message translates to:
  /// **'Prevention:'**
  String get caraPencegahan;

  /// No description provided for @daftarPustakaPenyakit.
  ///
  /// In en, this message translates to:
  /// **'Disease Library'**
  String get daftarPustakaPenyakit;

  /// No description provided for @pengaturan.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get pengaturan;

  /// No description provided for @bahasa.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get bahasa;

  /// No description provided for @notifikasi.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifikasi;

  /// No description provided for @tidakAdaNotifikasiBaru.
  ///
  /// In en, this message translates to:
  /// **'No new notifications at this time.'**
  String get tidakAdaNotifikasiBaru;

  /// No description provided for @bantuanDukungan.
  ///
  /// In en, this message translates to:
  /// **'Help & Support'**
  String get bantuanDukungan;

  /// No description provided for @tentangAplikasi.
  ///
  /// In en, this message translates to:
  /// **'About Application'**
  String get tentangAplikasi;

  /// No description provided for @pilihBahasa.
  ///
  /// In en, this message translates to:
  /// **'Select Language'**
  String get pilihBahasa;

  /// No description provided for @bahasaIndonesia.
  ///
  /// In en, this message translates to:
  /// **'Indonesian'**
  String get bahasaIndonesia;

  /// No description provided for @english.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// No description provided for @bahasaDiubah.
  ///
  /// In en, this message translates to:
  /// **'Language changed to Indonesian'**
  String get bahasaDiubah;

  /// No description provided for @languageChanged.
  ///
  /// In en, this message translates to:
  /// **'Language changed to English'**
  String get languageChanged;

  /// No description provided for @pengaturanNotifikasi.
  ///
  /// In en, this message translates to:
  /// **'Notification Settings'**
  String get pengaturanNotifikasi;

  /// No description provided for @izinkanNotifikasi.
  ///
  /// In en, this message translates to:
  /// **'Allow Notifications'**
  String get izinkanNotifikasi;

  /// No description provided for @terimaPengingat.
  ///
  /// In en, this message translates to:
  /// **'Receive daily reminders and weather updates.'**
  String get terimaPengingat;

  /// No description provided for @bantuanKontak.
  ///
  /// In en, this message translates to:
  /// **'For assistance using the app, you can contact our team at:'**
  String get bantuanKontak;

  /// No description provided for @versi.
  ///
  /// In en, this message translates to:
  /// **'Version'**
  String get versi;

  /// No description provided for @deskripsiSingkat.
  ///
  /// In en, this message translates to:
  /// **'Expert System Application for diagnosing diseases in rice plants using the Certainty Factor method.'**
  String get deskripsiSingkat;

  /// No description provided for @cuacaKalender.
  ///
  /// In en, this message translates to:
  /// **'Weather & Calendar'**
  String get cuacaKalender;

  /// No description provided for @kalenderTanam.
  ///
  /// In en, this message translates to:
  /// **'Planting Calendar'**
  String get kalenderTanam;

  /// No description provided for @catatanHarian.
  ///
  /// In en, this message translates to:
  /// **'Daily Notes'**
  String get catatanHarian;

  /// No description provided for @tambahCatatan.
  ///
  /// In en, this message translates to:
  /// **'Add notes for this date...'**
  String get tambahCatatan;

  /// No description provided for @simpanCatatan.
  ///
  /// In en, this message translates to:
  /// **'Save Note'**
  String get simpanCatatan;

  /// No description provided for @catatanBerhasilDisimpan.
  ///
  /// In en, this message translates to:
  /// **'Note successfully saved'**
  String get catatanBerhasilDisimpan;

  /// No description provided for @layananLokasiNonaktif.
  ///
  /// In en, this message translates to:
  /// **'Location services are disabled. Please enable them.'**
  String get layananLokasiNonaktif;

  /// No description provided for @izinLokasiDitolak.
  ///
  /// In en, this message translates to:
  /// **'Location permission denied.'**
  String get izinLokasiDitolak;

  /// No description provided for @izinLokasiDitolakPermanen.
  ///
  /// In en, this message translates to:
  /// **'Location permission permanently denied, we cannot request permission.'**
  String get izinLokasiDitolakPermanen;

  /// No description provided for @gagalMemuatCuaca.
  ///
  /// In en, this message translates to:
  /// **'Failed to load weather'**
  String get gagalMemuatCuaca;

  /// No description provided for @terjadiKesalahan.
  ///
  /// In en, this message translates to:
  /// **'An error occurred'**
  String get terjadiKesalahan;

  /// No description provided for @cuacaSaatIni.
  ///
  /// In en, this message translates to:
  /// **'Current Weather'**
  String get cuacaSaatIni;

  /// No description provided for @kecepatanAngin.
  ///
  /// In en, this message translates to:
  /// **'Wind Speed'**
  String get kecepatanAngin;

  /// No description provided for @memulaiSistem.
  ///
  /// In en, this message translates to:
  /// **'Starting system...'**
  String get memulaiSistem;

  /// No description provided for @metodeCertaintyFactor.
  ///
  /// In en, this message translates to:
  /// **'CERTAINTY FACTOR METHOD'**
  String get metodeCertaintyFactor;

  /// No description provided for @tingkatKeyakinan.
  ///
  /// In en, this message translates to:
  /// **'Confidence Level:'**
  String get tingkatKeyakinan;

  /// No description provided for @detailRiwayatDiagnosis.
  ///
  /// In en, this message translates to:
  /// **'Diagnosis History Detail'**
  String get detailRiwayatDiagnosis;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'id'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'id':
      return AppLocalizationsId();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
