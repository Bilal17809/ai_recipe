import 'dart:io';
import 'package:ai_recipe/models/models.dart';
import '/core/common/enums/import_mode.dart';
import '/core/common/common.dart';

class HomeState extends BaseState<int> {
  final List<RecipesModel> recipesList;
  final ImportMode mode;
  final File? selectedImage;

  const HomeState({
    super.isLoading,
    super.errorMessage,
    super.data,
    this.recipesList = const [],
    this.mode = ImportMode.camera,
    this.selectedImage,
  });

  @override
  HomeState copyWith({
    bool? isLoading,
    String? errorMessage,
    int? data,
    int? counter,
    List<RecipesModel>? recipesList,
    final ImportMode? mode,
    File? selectedImage,
  }) {
    return HomeState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      data: data ?? this.data,
      recipesList: recipesList ?? this.recipesList,
      mode: mode ?? this.mode,
      selectedImage: selectedImage ?? selectedImage,
    );
  }
}
