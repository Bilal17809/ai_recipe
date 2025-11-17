import 'package:ai_recipe/models/models.dart';

import '/core/common/common.dart';

class HomeState extends BaseState<int> {
final List<RecipesModel> recipesList;
  const HomeState({
    super.isLoading,
    super.errorMessage,
    super.data,
    this.recipesList = const []
  });

  @override
  HomeState copyWith({
    bool? isLoading,
    String? errorMessage,
    int? data,
    int? counter,
    List<RecipesModel>? recipesList
  }) {
    return HomeState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      data: data ?? this.data,
      recipesList: recipesList ?? this.recipesList
    );
  }
}
