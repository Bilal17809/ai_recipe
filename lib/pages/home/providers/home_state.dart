import '/core/common/common.dart';

class HomeState extends BaseState<int> {
  final int counter;
  const HomeState({
    super.isLoading,
    super.errorMessage,
    super.data,
    this.counter = 0,
  });

  @override
  HomeState copyWith({
    bool? isLoading,
    String? errorMessage,
    int? data,
    int? counter,
  }) {
    return HomeState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      data: data ?? this.data,
      counter: counter ?? this.counter,
    );
  }
}
