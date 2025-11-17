import 'package:ai_recipe/pages/recipes/providers/recipes_notifiers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'home_state.dart';
part 'home_notifier.g.dart';

@riverpod
class HomeNotifier extends _$HomeNotifier {
  @override
  HomeState build() {
    // final recipes = ref.watch(recipesNotifiersProvider).recipesList;
    //  Future.microtask(()=>loadRecipes());
    return HomeState();
  }
  //
  //
  // Future<void> loadRecipes() async {
  //   try {
  //     state = state.copyWith(isLoading: true);
  //     final recipeList = ref.watch(recipesNotifiersProvider).recipesList;
  //   await  Future.delayed(Duration(seconds: 1));
  //     if(recipeList.isNotEmpty){
  //       state = state.copyWith(recipesList: recipeList, isLoading: false);
  //     }
  //
  //   } catch (e) {
  //     state = state.copyWith(isLoading: false, errorMessage: e.toString());
  //   }
  // }
}
