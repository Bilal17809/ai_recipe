

import 'package:ai_recipe/core/common/base_state.dart';
import 'package:ai_recipe/models/models.dart';

class RecipesState extends BaseState<dynamic>{
    final List<RecipesModel> recipesList;
  RecipesState({
    super.isLoading,
    super.errorMessage,
    super.data,
    this.recipesList = const []
});
  @override
  RecipesState copyWith({
    bool? isLoading,
    String? errorMessage,
    var data,
    List<RecipesModel>? recipesList
  }){
    return RecipesState(
        isLoading: isLoading ?? this.isLoading,
        errorMessage: errorMessage ?? this.errorMessage,
        data: data ?? this.data,
        recipesList: recipesList ?? this.recipesList
    );
  }
}