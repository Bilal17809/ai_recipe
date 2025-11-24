
import 'package:ai_recipe/data/models/recipes_model.dart';

import '../../domain/repo/recipe_repo.dart';
import '../data_source/remote_data_source.dart';
import '../models/recipe.dart';


class RecipeRepositoryImpl implements RecipeRepository {
  final RemoteDataSource remote;

  RecipeRepositoryImpl(this.remote);

  // @override
  // Future<Recipe> getRecipeFromImage(String imagePath) async {
  //   final model = await remote.analyzeFoodImage(imagePath);
  //   return Recipe(
  //     title: model.title,
  //     ingredients: model.ingredients,
  //     steps: model.steps,
  //   );
  // }


    @override
     Future<RecipeModelForMisteral> getRecipeFromMistral(String imagePath)async{
    final model = await remote.analyzeFoodImageWithMistral(imagePath);
    return RecipeModelForMisteral(
        title: model.title,
        ingredients: model.ingredients,
        steps: model.steps,
        cookingTime: model.cookingTime,
      servings: model.servings
    );
    }
}


