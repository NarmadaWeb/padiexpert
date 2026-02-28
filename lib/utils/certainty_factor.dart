import '../data/expert_system_data.dart';

class DiagnosisResult {
  final Disease disease;
  final double certaintyPercentage;

  DiagnosisResult({
    required this.disease,
    required this.certaintyPercentage,
  });
}

class CertaintyFactorEngine {
  /// Calculate the probability of each disease based on user inputs (0-100 scale).
  static List<DiagnosisResult> calculate(Map<String, double> userCfValues) {
    List<DiagnosisResult> results = [];

    for (var disease in ExpertSystemData.diseases) {
      double cfCombine = 0.0;
      bool isFirstSymptom = true;

      for (var entry in disease.symptomWeights.entries) {
        String symptomId = entry.key;
        double weightFromExpert = entry.value;

        // User CF is 0 to 100, normalize it to 0.0 to 1.0
        double userCf = (userCfValues[symptomId] ?? 0.0) / 100.0;

        if (userCf > 0) {
          // CF(H,E) = CF(E) * CF(Rule)
          double cfSymptom = userCf * weightFromExpert;

          if (isFirstSymptom) {
            cfCombine = cfSymptom;
            isFirstSymptom = false;
          } else {
            // Formula for CF Combine (Positive CFs)
            // CF_combine = CF_old + CF_new * (1 - CF_old)
            cfCombine = cfCombine + cfSymptom * (1 - cfCombine);
          }
        }
      }

      if (cfCombine > 0) {
        results.add(
          DiagnosisResult(
            disease: disease,
            certaintyPercentage: cfCombine * 100,
          ),
        );
      }
    }

    // Sort results by certainty percentage in descending order
    results.sort((a, b) => b.certaintyPercentage.compareTo(a.certaintyPercentage));

    return results;
  }
}
