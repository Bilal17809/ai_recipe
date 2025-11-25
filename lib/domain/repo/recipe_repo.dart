import '../../data/models/recipe.dart';
import '../../data/models/recipes_model.dart';


abstract class RecipeRepository {
  // Future<Recipe> getRecipeFromImage(String imagePath);
  Future<RecipeModelForMistral> getRecipeFromMistral(String imagePath);
}
