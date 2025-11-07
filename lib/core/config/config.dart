import 'dart:convert';
import 'package:flutter/services.dart';

class AppConfig {
  final bool canPrintConsole;
  final String apiBaseUrl;
  final String dictionaryBaseUrl;
  final String mistralBaseUrl;

  AppConfig({
    required this.canPrintConsole,
    required this.apiBaseUrl,
    required this.dictionaryBaseUrl,
    required this.mistralBaseUrl,
  });

  static Future<AppConfig> loadFromAsset(String path) async {
    final jsonString = await rootBundle.loadString(path);
    final data = jsonDecode(jsonString);

    return AppConfig(
      canPrintConsole: data['can_print_console'] ?? false,
      apiBaseUrl: data['api_base_url'],
      dictionaryBaseUrl: data['dictionary_base_url'],
      mistralBaseUrl: data['mistral_base_url'],
    );
  }
}
