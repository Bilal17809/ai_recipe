import 'package:ai_recipe/core/common/base_state.dart';

class DashboardState extends BaseState<int>{
  final int changeTabIndex;
  DashboardState({
    super.isLoading,
    super.errorMessage,
    super.data,
    this.changeTabIndex = 0
});

  @override
  DashboardState copyWith({
    bool? isLoading,
    String? errorMessage,
    int ? data,
    int ? changeTabIndex
}){
    return DashboardState(
    isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      data: data ?? this.data,
      changeTabIndex: changeTabIndex ?? this.changeTabIndex
    );
}
}