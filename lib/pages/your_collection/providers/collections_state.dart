


import 'package:ai_recipe/core/common/base_state.dart';

class CollectionsState extends BaseState<int>{

  CollectionsState({
    super.isLoading,
    super.errorMessage,
    super.data,
});

  @override
   CollectionsState copyWith({
    bool? isLoading,
    String? errorMessage,
    var data
}){
    return CollectionsState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      data: data ?? this.data
    );
  }
}


