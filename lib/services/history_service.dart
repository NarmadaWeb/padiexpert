import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class DiagnosisHistory {
  final String id;
  final String diseaseName;
  final double percentage;
  final DateTime date;

  DiagnosisHistory({
    required this.id,
    required this.diseaseName,
    required this.percentage,
    required this.date,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'diseaseName': diseaseName,
      'percentage': percentage,
      'date': date.toIso8601String(),
    };
  }

  factory DiagnosisHistory.fromJson(Map<String, dynamic> json) {
    return DiagnosisHistory(
      id: json['id'],
      diseaseName: json['diseaseName'],
      percentage: (json['percentage'] as num).toDouble(),
      date: DateTime.parse(json['date']),
    );
  }
}

class HistoryService {
  static const String _historyKey = 'diagnosis_history';

  Future<void> saveDiagnosis(DiagnosisHistory history) async {
    final prefs = await SharedPreferences.getInstance();
    final histories = await getHistories();
    histories.insert(0, history); // Add to the beginning

    // Keep only last 20 histories to avoid huge storage
    if (histories.length > 20) {
      histories.removeLast();
    }

    final jsonList = histories.map((h) => jsonEncode(h.toJson())).toList();
    await prefs.setStringList(_historyKey, jsonList);
  }

  Future<List<DiagnosisHistory>> getHistories() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonList = prefs.getStringList(_historyKey);

    if (jsonList == null) {
      return [];
    }

    return jsonList.map((jsonStr) => DiagnosisHistory.fromJson(jsonDecode(jsonStr))).toList();
  }

  Future<void> clearHistory() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_historyKey);
  }
}
