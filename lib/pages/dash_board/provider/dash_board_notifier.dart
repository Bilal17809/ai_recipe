import 'package:ai_recipe/pages/dash_board/provider/dash_board_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'dash_board_notifier.g.dart';

@riverpod
class DashBoardNotifier extends _$DashBoardNotifier {
  @override
  DashBoardState build() => const DashBoardState();

  void changeTab(int index) {
    state = state.copyWith(currentIndex: index);
  }

  void setLoading(bool value) {
    state = state.copyWith(isLoading: value);
  }

  void setError(String message) {
    state = state.copyWith(errorMessage: message, isLoading: false);
  }
}

