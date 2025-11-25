// import '../config/config.dart';
//
// class DependencyInjection {
//   static Future<void> init(AppConfig config) async {
//
//   }
// }

import 'package:ai_recipe/domain/usecasses/get_recipefrommitsreal_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ai_recipe/core/network/api_client.dart';
import 'package:ai_recipe/data/data_source/remote_data_source.dart';
import 'package:ai_recipe/domain/repo/recipe_repo.dart';
import '../../data/repo_imp/repo_implementation.dart';
import '../../domain/usecasses/recipe_usecase.dart';


class DependencyInjection {

}

final apiClientProvider = Provider<ApiClient>((ref) {
  return ApiClient();
});

final remoteDataSourceProvider = Provider<RemoteDataSource>((ref) {
  final api = ref.watch(apiClientProvider);
  return RemoteDataSource(api);
});

final recipeRepositoryProvider = Provider<RecipeRepository>((ref) {
  final remote = ref.watch(remoteDataSourceProvider);
  return RecipeRepositoryImpl(remote);
});

// final getRecipeFromImageProvider = Provider<GetRecipeFromImage>((ref) {
//   final repo = ref.watch(recipeRepositoryProvider);
//   return GetRecipeFromImage(repo);
// });



final getRecipeFromMisteralProvider = Provider<GetRecipeFromMisteral>((ref) {
  final repo = ref.watch(recipeRepositoryProvider);
  return GetRecipeFromMisteral(repo);
});