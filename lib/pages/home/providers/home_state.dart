import 'package:ai_recipe/models/models.dart';
import 'package:camera/camera.dart';

import '../../../core/common/enums/import_mode.dart';
import '/core/common/common.dart';

class HomeState extends BaseState<int> {

  final List<RecipesModel> recipesList;
  final ImportMode mode;
  final CameraController? camController;
  final bool? isInitialized;

  const HomeState({
    super.isLoading,
    super.errorMessage,
    super.data,
    this.recipesList = const [],
    this.mode = ImportMode.camera,
    this.camController,
    this.isInitialized,
  });

  @override
  HomeState copyWith({
    bool? isLoading,
    String? errorMessage,
    int? data,
    int? counter,
    List<RecipesModel>? recipesList,
    final ImportMode? mode,
    final CameraController? camController,
    final bool? isInitialized,
  }) {
    return HomeState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      data: data ?? this.data,
      recipesList: recipesList ?? this.recipesList,
      mode: mode ?? this.mode,
      camController: camController ?? this.camController,
      isInitialized: isInitialized ?? this.isInitialized,
    );
  }
}
