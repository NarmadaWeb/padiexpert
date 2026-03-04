import 'package:flutter/material.dart';
import '../main.dart' show AppColors;

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Pengaturan',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                    title: 'Bahasa',
                    isDark: isDark,
                    onTap: () {
                      _showLanguageDialog(context);
                    },
                  ),
                  const SizedBox(height: 8),
                  _buildActionLink(
                    context: context,
                    icon: Icons.notifications,
                    title: 'Notifikasi',
                    isDark: isDark,
                    onTap: () {
                      _showComingSoonSnackbar(context, 'Pengaturan Notifikasi');
                    },
                  ),
                  const SizedBox(height: 8),
                  _buildActionLink(
                    context: context,
                    icon: Icons.help_outline,
                    title: 'Bantuan & Dukungan',
                    isDark: isDark,
                    onTap: () {
                      _showComingSoonSnackbar(context, 'Bantuan & Dukungan');
                    },
                  ),
                  const SizedBox(height: 8),
                  _buildActionLink(
                    context: context,
                    icon: Icons.info_outline,
                    title: 'Tentang Aplikasi',
                    isDark: isDark,
                    onTap: () {
                      _showComingSoonSnackbar(context, 'Tentang Aplikasi');
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

  void _showComingSoonSnackbar(BuildContext context, String title) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Fitur $title akan segera hadir!')),
    );
  }

  void _showLanguageDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Pilih Bahasa'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: const Text('Bahasa Indonesia'),
                leading: const Icon(Icons.language),
                onTap: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Bahasa diubah ke Indonesia')),
                  );
                },
              ),
              ListTile(
                title: const Text('English'),
                leading: const Icon(Icons.language),
                onTap: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Language changed to English')),
                  );
                },
              ),
            ],
          ),
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
