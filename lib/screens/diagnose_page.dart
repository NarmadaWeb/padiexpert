import 'package:flutter/material.dart';
import '../main.dart' show AppColors;

class DiagnosePage extends StatefulWidget {
  const DiagnosePage({super.key});

  @override
  State<DiagnosePage> createState() => _DiagnosePageState();
}

class _DiagnosePageState extends State<DiagnosePage> {
  final Map<String, double> cfValues = {'s1': 75, 's2': 0, 's3': 40};

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: isDark
            ? AppColors.backgroundDark.withValues(alpha: 0.9)
            : AppColors.backgroundLight.withValues(alpha: 0.9),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {},
        ),
        title: const Text(
          'Symptom Selection',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              'Library',
              style: TextStyle(
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(20),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildStepDot(true, false),
                const SizedBox(width: 8),
                _buildStepDot(true, false),
                const SizedBox(width: 8),
                _buildStepDot(true, true),
                const SizedBox(width: 8),
                _buildStepDot(false, false, isDark: isDark),
                const SizedBox(width: 8),
                _buildStepDot(false, false, isDark: isDark),
              ],
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          ListView(
            padding: const EdgeInsets.fromLTRB(16, 24, 16, 100),
            children: [
              const Text(
                'Step 3: Leaf Symptoms',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                'Identify symptoms and indicate your level of certainty (Certainty Factor).',
                style: TextStyle(
                  fontSize: 16,
                  color: isDark ? Colors.grey[400] : Colors.grey[600],
                ),
              ),
              const SizedBox(height: 24),
              _buildSymptomCard(
                's1',
                'Yellowish Streaks',
                'Vertical yellow or pale green lines appearing on leaf blades.',
                Icons.eco,
                isDark,
              ),
              const SizedBox(height: 16),
              _buildSymptomCard(
                's2',
                'Wavy Leaf Edges',
                'Margins show irregular drying or wavy appearance.',
                Icons.water_drop,
                isDark,
              ),
              const SizedBox(height: 16),
              _buildSymptomCard(
                's3',
                'Brown Spots',
                'Small, oval lesions with gray centers and brown borders.',
                Icons.lens_blur,
                isDark,
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    isDark
                        ? AppColors.backgroundDark
                        : AppColors.backgroundLight,
                    isDark
                        ? AppColors.backgroundDark
                        : AppColors.backgroundLight,
                    isDark
                        ? AppColors.backgroundDark.withValues(alpha: 0)
                        : AppColors.backgroundLight.withValues(alpha: 0),
                  ],
                ),
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.black87,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 8,
                ),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Get Result',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(width: 8),
                    Icon(Icons.arrow_forward),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStepDot(bool active, bool current, {bool isDark = false}) {
    return Container(
      height: 6,
      width: current ? 40 : 24,
      decoration: BoxDecoration(
        color: current
            ? AppColors.primary
            : (active
                  ? AppColors.primary.withValues(alpha: 0.4)
                  : (isDark ? Colors.grey[700] : Colors.grey[300])),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }

  Widget _buildSymptomCard(
    String id,
    String title,
    String desc,
    IconData icon,
    bool isDark,
  ) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isDark ? Colors.grey[800]?.withValues(alpha: 0.5) : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.primary.withValues(alpha: 0.2)),
        boxShadow: isDark
            ? []
            : [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.02),
                  blurRadius: 5,
                  offset: const Offset(0, 2),
                ),
              ],
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: AppColors.primary, size: 32),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      desc,
                      style: TextStyle(
                        fontSize: 14,
                        color: isDark ? Colors.grey[400] : Colors.grey[500],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'NOT SURE',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                  color: isDark ? Colors.grey[500] : Colors.grey[400],
                ),
              ),
              const Text(
                'VERY CERTAIN',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          SliderTheme(
            data: SliderThemeData(
              activeTrackColor: AppColors.primary,
              inactiveTrackColor: isDark ? Colors.grey[700] : Colors.grey[200],
              thumbColor: AppColors.primary,
              overlayColor: AppColors.primary.withValues(alpha: 0.2),
              trackHeight: 8,
              thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 10),
            ),
            child: Slider(
              value: cfValues[id]!,
              min: 0,
              max: 100,
              onChanged: (val) {
                setState(() {
                  cfValues[id] = val;
                });
              },
            ),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: cfValues[id]! > 0
                  ? AppColors.primary.withValues(alpha: 0.2)
                  : (isDark ? Colors.grey[800] : Colors.grey[100]),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(
              cfValues[id]! > 0
                  ? 'CF: ${(cfValues[id]! / 100).toStringAsFixed(2)}'
                  : 'Not Observed',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: cfValues[id]! > 0
                    ? AppColors.primary
                    : (isDark ? Colors.grey[400] : Colors.grey[400]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
