import 'package:flutter/material.dart';
import 'package:app/l10n/app_localizations.dart';
import '../main.dart' show AppColors, PadiExpertApp;
import '../services/language_service.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          AppLocalizations.of(context)!.pengaturan,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
              child: Column(
                children: [
                  _buildActionLink(
                    context: context,
                    icon: Icons.language,
                    title: AppLocalizations.of(context)!.bahasa,
                    isDark: isDark,
                    onTap: () {
                      _showLanguageDialog(context);
                    },
                  ),
                  const SizedBox(height: 8),
                  _buildActionLink(
                    context: context,
                    icon: Icons.notifications,
                    title: AppLocalizations.of(context)!.notifikasi,
                    isDark: isDark,
                    onTap: () {
                      _showNotificationDialog(context, isDark);
                    },
                  ),
                  const SizedBox(height: 8),
                  _buildActionLink(
                    context: context,
                    icon: Icons.help_outline,
                    title: AppLocalizations.of(context)!.bantuanDukungan,
                    isDark: isDark,
                    onTap: () {
                      _showHelpDialog(context, isDark);
                    },
                  ),
                  const SizedBox(height: 8),
                  _buildActionLink(
                    context: context,
                    icon: Icons.info_outline,
                    title: AppLocalizations.of(context)!.tentangAplikasi,
                    isDark: isDark,
                    onTap: () {
                      _showAboutDialog(context, isDark);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showCustomSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message, style: const TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: AppColors.primary,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        margin: const EdgeInsets.all(16),
      ),
    );
  }

  void _showLanguageDialog(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final languageService = LanguageService();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          backgroundColor: isDark ? Colors.grey[900] : Colors.white,
          title: Text(AppLocalizations.of(context)!.pilihBahasa, style: const TextStyle(fontWeight: FontWeight.bold)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text(AppLocalizations.of(context)!.bahasaIndonesia),
                leading: const Icon(Icons.language, color: AppColors.primary),
                onTap: () async {
                  await languageService.saveLanguage('id');
                  if (context.mounted) {
                    PadiExpertApp.setLocale(context, const Locale('id'));
                    Navigator.pop(context);
                    _showCustomSnackbar(context, AppLocalizations.of(context)!.bahasaDiubah);
                  }
                },
              ),
              ListTile(
                title: Text(AppLocalizations.of(context)!.english),
                leading: const Icon(Icons.language, color: Colors.grey),
                onTap: () async {
                  await languageService.saveLanguage('en');
                  if (context.mounted) {
                    PadiExpertApp.setLocale(context, const Locale('en'));
                    Navigator.pop(context);
                    _showCustomSnackbar(context, AppLocalizations.of(context)!.languageChanged);
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _showNotificationDialog(BuildContext context, bool isDark) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            bool isNotifEnabled = true;
            return AlertDialog(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              backgroundColor: isDark ? Colors.grey[900] : Colors.white,
              title: const Text('Pengaturan Notifikasi', style: TextStyle(fontWeight: FontWeight.bold)),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SwitchListTile(
                title: Text(AppLocalizations.of(context)!.izinkanNotifikasi),
                subtitle: Text(AppLocalizations.of(context)!.terimaPengingat),
                    value: isNotifEnabled,
                    activeColor: AppColors.primary,
                    onChanged: (bool value) {
                      setState(() {
                        isNotifEnabled = value;
                      });
                    },
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text(AppLocalizations.of(context)!.close, style: const TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold)),
                ),
              ],
            );
          },
        );
      },
    );
  }

  void _showHelpDialog(BuildContext context, bool isDark) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          backgroundColor: isDark ? Colors.grey[900] : Colors.white,
          title: Text(AppLocalizations.of(context)!.bantuanDukungan, style: const TextStyle(fontWeight: FontWeight.bold)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(AppLocalizations.of(context)!.bantuanKontak),
              const SizedBox(height: 12),
              Row(
                children: const [
                  Icon(Icons.email, color: AppColors.primary),
                  SizedBox(width: 8),
                  Text('support@padiexpert.com', style: TextStyle(fontWeight: FontWeight.w600)),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: const [
                  Icon(Icons.phone, color: AppColors.primary),
                  SizedBox(width: 8),
                  Text('+62 812 3456 7890', style: TextStyle(fontWeight: FontWeight.w600)),
                ],
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(AppLocalizations.of(context)!.close, style: const TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold)),
            ),
          ],
        );
      },
    );
  }

  void _showAboutDialog(BuildContext context, bool isDark) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          backgroundColor: isDark ? Colors.grey[900] : Colors.white,
          title: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.2),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.info, color: AppColors.primary),
              ),
              const SizedBox(width: 12),
              Text(AppLocalizations.of(context)!.tentangAplikasi, style: const TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(AppLocalizations.of(context)!.appTitle, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Text('${AppLocalizations.of(context)!.versi} 1.0.0'),
              const SizedBox(height: 16),
              Text(AppLocalizations.of(context)!.deskripsiSingkat),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(AppLocalizations.of(context)!.close, style: const TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold)),
            ),
          ],
        );
      },
    );
  }

  Widget _buildActionLink({
    required BuildContext context,
    required IconData icon,
    required String title,
    required bool isDark,
    required VoidCallback onTap,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: isDark ? Colors.grey[900] : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isDark ? Colors.grey[800]! : Colors.grey[200]!,
        ),
      ),
      child: ListTile(
        leading: Icon(icon, color: AppColors.primary),
        title: Text(
          title,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
        ),
        trailing: Icon(Icons.chevron_right, color: Colors.grey[400]),
        onTap: onTap,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
    );
  }
}
