import 'package:flutter/material.dart';
import '../main.dart' show AppColors;
import '../data/expert_system_data.dart';
import 'result_page.dart';

class DiagnosePage extends StatefulWidget {
  const DiagnosePage({super.key});

  @override
  State<DiagnosePage> createState() => _DiagnosePageState();
}

class _DiagnosePageState extends State<DiagnosePage> {
  final Map<String, bool> isSymptomActive = {};
  final Map<String, double> cfValues = {};

  @override
  void initState() {
    super.initState();
    for (var symptom in ExpertSystemData.symptoms) {
      isSymptomActive[symptom.id] = false;
      cfValues[symptom.id] = 1.0; // Default CF 1.0 when active
    }
  }

  void _calculateResult() {
    final Map<String, double> finalCfValues = {};
    for (var symptom in ExpertSystemData.symptoms) {
      if (isSymptomActive[symptom.id] == true) {
        finalCfValues[symptom.id] = (cfValues[symptom.id] ?? 1.0) * 100; // Convert 0.2-1.0 scale to 0-100 for existing logic
      } else {
        finalCfValues[symptom.id] = 0.0;
      }
    }
    // Navigate to ResultPage and pass finalCfValues
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultPage(userCfValues: finalCfValues),
      ),
    );
  }

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
          'Pilihan Gejala',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              'Pustaka',
              style: TextStyle(
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          ListView(
            padding: const EdgeInsets.fromLTRB(16, 24, 16, 100),
            children: [
              const Text(
                'Diagnosa Penyakit',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                'Identifikasi gejala dan tentukan tingkat kepastian Anda (Certainty Factor).',
                style: TextStyle(
                  fontSize: 16,
                  color: isDark ? Colors.grey[400] : Colors.grey[600],
                ),
              ),
              const SizedBox(height: 24),
              ...ExpertSystemData.symptoms.map((symptom) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: _buildSymptomCard(
                    symptom.id,
                    symptom.title,
                    symptom.description,
                    Icons.eco,
                    isDark,
                  ),
                );
              }),
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
                onPressed: _calculateResult,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Dapatkan Hasil',
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
              Switch(
                value: isSymptomActive[id] ?? false,
                activeTrackColor: AppColors.primary.withValues(alpha: 0.5),
                activeThumbColor: AppColors.primary,
                onChanged: (bool value) {
                  setState(() {
                    isSymptomActive[id] = value;
                    if (value && cfValues[id] == null) {
                      cfValues[id] = 1.0;
                    }
                  });
                },
              ),
            ],
          ),
          if (isSymptomActive[id] == true) ...[
            const SizedBox(height: 16),
            const Text(
              'Tingkat Keyakinan:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
            const SizedBox(height: 8),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [0.2, 0.4, 0.6, 0.8, 1.0].map((value) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: ChoiceChip(
                      label: Text(value.toString()),
                      selected: cfValues[id] == value,
                      selectedColor: AppColors.primary,
                      backgroundColor: isDark ? Colors.grey[700] : Colors.grey[200],
                      labelStyle: TextStyle(
                        color: cfValues[id] == value ? Colors.black : (isDark ? Colors.white : Colors.black),
                        fontWeight: FontWeight.bold,
                      ),
                      onSelected: (bool selected) {
                        if (selected) {
                          setState(() {
                            cfValues[id] = value;
                          });
                        }
                      },
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
