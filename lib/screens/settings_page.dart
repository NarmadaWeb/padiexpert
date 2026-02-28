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
                    icon: Icons.language,
                    title: 'Bahasa',
                    isDark: isDark,
                  ),
                  const SizedBox(height: 8),
                  _buildActionLink(
                    icon: Icons.notifications,
                    title: 'Notifikasi',
                    isDark: isDark,
                  ),
                  const SizedBox(height: 8),
                  _buildActionLink(
                    icon: Icons.help_outline,
                    title: 'Bantuan & Dukungan',
                    isDark: isDark,
                  ),
                  const SizedBox(height: 8),
                  _buildActionLink(
                    icon: Icons.info_outline,
                    title: 'Tentang Aplikasi',
                    isDark: isDark,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionLink({
    required IconData icon,
    required String title,
    required bool isDark,
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
        onTap: () {},
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
    );
  }
}
