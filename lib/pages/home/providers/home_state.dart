import 'dart:io';
import 'package:ai_recipe/data/models/recipe.dart';
import 'package:ai_recipe/models/models.dart';
import '/core/common/enums/import_mode.dart';
import '/core/common/common.dart';

class HomeState extends BaseState<int> {

  final List<RecipesModel> recipesList;
  final ImportMode mode;
  final File? selectedImage;
  final String? cate;
  List<String>? ingredients = [];
  final List<String>? recipeIngredients;
  final List<String>? recipeSteps;


  HomeState({
    super.isLoading,
    super.errorMessage,
    super.data,
    this.recipesList = const [],
    this.mode = ImportMode.camera,
    this.selectedImage,
    this.cate,
    this.ingredients = const [],
     this.recipeIngredients = const [],
     this.recipeSteps = const []
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
    final String? cate,
    List<String>? ingredients,
    List<String>? recipeIngredients,
    List<String>? recipeSteps,

  }) {
    return HomeState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      data: data ?? this.data,
      recipesList: recipesList ?? this.recipesList,
      mode: mode ?? this.mode,
      selectedImage: selectedImage ?? this.selectedImage,
      cate: cate ?? this.cate,
      ingredients: ingredients ?? this.ingredients,
        recipeIngredients: recipeIngredients ?? this.recipeIngredients,
      recipeSteps: recipeSteps ?? this.recipeSteps,
    );
  }
}
