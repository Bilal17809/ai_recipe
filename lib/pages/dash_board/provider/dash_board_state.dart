import '/core/common/common.dart';

class DashBoardState extends BaseState<int> {
  final int currentIndex;
  const DashBoardState({
    super.isLoading,
    super.errorMessage,
    super.data,
    this.currentIndex = 0,
  });

  @override
  DashBoardState copyWith({
    bool? isLoading,
    String? errorMessage,
    int? data,
    int? currentIndex,
  }) {
    return DashBoardState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      data: data ?? this.data,
      currentIndex: currentIndex ?? this.currentIndex,
    );
  }
}
