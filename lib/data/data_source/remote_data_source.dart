import 'package:ai_recipe/core/config/api_routes.dart';
import 'package:ai_recipe/core/network/api_client.dart';

import '../models/recipe.dart';
import '../models/recipes_model.dart';

class RemoteDataSource {
  final ApiClient _apiClient;

  RemoteDataSource(this._apiClient);

  // Future<RecipeModel> analyzeFoodImage(String imagePath) async {
  //   try {
  //     return await _apiClient.getRecipeFromImage(imagePath, ApiRoutes.apiKey);
  //   } catch (e) {
  //     rethrow;
  //   }
  // }


  Future<RecipeModelForMisteral> analyzeFoodImageWithMistral(String imagePath) async{
   try{
     return await _apiClient.getRecipeFromMistral(imagePath, ApiRoutes.misteralApi);
   }catch(e){
     rethrow;
   }
  }

}