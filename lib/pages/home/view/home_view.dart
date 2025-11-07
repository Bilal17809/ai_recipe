import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/home_notifier.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeProvider);
    final notifier = ref.read(homeProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: state.isLoading
            ? const CircularProgressIndicator()
            : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(state.errorMessage ?? 'No message yet'),
            const SizedBox(height: 16),
            Text('Counter: ${state.counter}', style: const TextStyle(fontSize: 24)),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: notifier.increment,
              child: const Text('Increment'),
            ),
            ElevatedButton(
              onPressed: notifier.loadMessage,
              child: const Text('Load Message'),
            ),
          ],
        ),
      ),
    );
  }
}
