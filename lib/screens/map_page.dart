import 'package:flutter/material.dart';
import '../main.dart' show AppColors;

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: isDark
            ? AppColors.backgroundDark
            : AppColors.backgroundLight,
        elevation: 1,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {},
        ),
        title: const Text(
          'Outbreak Map',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(icon: const Icon(Icons.info_outline), onPressed: () {}),
        ],
      ),
      body: Stack(
        children: [
          // Map Background
          Container(
            decoration: const BoxDecoration(
              color: Colors.grey,
              image: DecorationImage(
                image: NetworkImage(
                  'https://lh3.googleusercontent.com/aida-public/AB6AXuDS-hgxTGTk1anFZMB2RS3stIQU7rCLvfqDWqxV0hnCVmcJ69jKhuc3XOAxUxcpp3wI8CtG6EkVrdTz-0jOdwOB2-nhcDxh_SBmx6hXTgKqZlSZ2ZBUhp0mi3WLehKNUPiNFT8u7L393q_r6ICv0cUXQz1JnROYFKk7vnQyKmTkueS_UdEqRKsCJuzhjgZDFB9AmH0ymesCf9UrTnKRlbncpMaqhelkwoDEPE9kkziXpgf21UB13V31HbFzIglBb57b4lSD3kDPVXFo',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Location Pin
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: isDark ? AppColors.backgroundDark : Colors.white,
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: AppColors.primary),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.1),
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: const Text(
                    'Rice Blast (88%)',
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                  ),
                ),
                Icon(
                  Icons.location_on,
                  size: 48,
                  color: AppColors.primary,
                  shadows: [
                    Shadow(
                      color: Colors.black.withValues(alpha: 0.3),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
