import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'home_state.dart';
part 'home_notifier.g.dart';

@riverpod
class HomeNotifier extends _$HomeNotifier {
  @override
  HomeState build() => const HomeState();

  void increment() {
    state = state.copyWith(counter: state.counter + 1);
  }

  Future<void> loadMessage() async {
    state = state.copyWith(isLoading: true);
    await Future.delayed(const Duration(seconds: 2));
    state = state.copyWith(
      isLoading: false,
      errorMessage: "Welcome to Riverpod Advanced (No Equatable)!",
    );
  }
}
