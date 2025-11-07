import 'package:ai_recipe/extension/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/pages/theme_mode/provider/theme_mode_notifier.dart';

class SettingView extends ConsumerWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    return Scaffold(
      backgroundColor:context.bgColor,
      body: Center(
        child: ElevatedButton(
          onPressed: () => ref.read(themeProvider.notifier).toggleTheme(),
          child: Text('Toggle Theme (${theme.themeMode.name})'),
        ),
      ),
    );
  }
}
