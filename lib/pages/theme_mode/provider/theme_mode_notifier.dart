import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '/core/local_storage/storage_helper.dart';
import 'theme_mode_state.dart';

part 'theme_mode_notifier.g.dart';

@riverpod
class ThemeNotifier extends _$ThemeNotifier {
  late final StorageService _storageService;
  @override
  ThemeState build() {
    _storageService = StorageService();
    final saved = _storageService.getThemeMode();
    ThemeMode mode;
    switch (saved) {
      case 'light':
        mode = ThemeMode.light;
        break;
      case 'dark':
        mode = ThemeMode.dark;
        break;
      default:
        mode = ThemeMode.system;
    }
    return ThemeState(themeMode: mode);
  }

  Future<void> toggleTheme() async {
    final newMode =
    state.themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    state = state.copyWith(themeMode: newMode);

    await _storageService.saveThemeMode(newMode.name);
  }
}
