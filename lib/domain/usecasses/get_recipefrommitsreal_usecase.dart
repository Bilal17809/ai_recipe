import 'package:ai_recipe/data/models/recipe.dart';
import 'package:ai_recipe/domain/repo/recipe_repo.dart';

import '../../data/repo_imp/repo_implementation.dart';

class GetRecipeFromMisteral {

   final RecipeRepository repository;

  GetRecipeFromMisteral(this.repository);

  Future<RecipeModelForMistral> call(String imagePath) {
    return repository.getRecipeFromMistral(imagePath);
  }



}