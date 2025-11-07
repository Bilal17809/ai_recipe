import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static late SharedPreferences _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static const _learnProgress = 'learn_progress';
  static const _dailyLearnProgress = 'daily_learn_progress';



  Future<void> saveLearnProgress(int catId, double progress) async {
    final progressData = _prefs.getString(_learnProgress);
    Map<String, dynamic> data = {};
    if (progressData != null) {
      data = jsonDecode(progressData);
    }
    data[catId.toString()] = progress;
    await _prefs.setString(_learnProgress, jsonEncode(data));
  }

// Load saved progress for a specific category
  double loadLearnProgress(int catId) {
    final progressData = _prefs.getString(_learnProgress);
    if (progressData == null) return 0.0;
    final data = jsonDecode(progressData) as Map<String, dynamic>;
    return (data[catId.toString()] ?? 0.0).toDouble();
  }

  double loadOverallLearnProgress() {
    final progressData = _prefs.getString(_learnProgress);
    if (progressData == null) return 0.0;

    final data = jsonDecode(progressData) as Map<String, dynamic>;
    if (data.isEmpty) return 0.0;

    final values = data.values.map((e) => (e as num).toDouble()).toList();
    final total = values.fold<double>(0.0, (sum, val) => sum + val);
    return total / values.length;
  }

  String? getDailyProgressData() => _prefs.getString(_dailyLearnProgress);

  Future<void> saveDailyProgressData(String data) async {
    await _prefs.setString(_dailyLearnProgress, data);
  }

  Future<void> saveLearnedRules(List<dynamic> rules) async {
    final encoded = jsonEncode(rules);
    await _prefs.setString('learned_rules', encoded);
  }

  List<dynamic> getLearnedRules() {
    final jsonString = _prefs.getString('learned_rules');
    if (jsonString == null) return [];
    return jsonDecode(jsonString) as List<dynamic>;
  }



}
