import 'package:ai_recipe/models/models.dart';
import 'package:ai_recipe/pages/recipes/providers/recipes_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'recipes_notifiers.g.dart';

@riverpod
class RecipesNotifiers extends _$RecipesNotifiers {

  @override
  RecipesState build() {
   Future.microtask(() => _loadRecipes());
    return RecipesState(
    );
  }

  Future<void> _loadRecipes() async {
    state = state.copyWith(isLoading:  true);
    await Future.delayed(const Duration(seconds: 1));
    state = state.copyWith(
      recipesList: [
        RecipesModel(
          title: "Quick and Easy Tomato Soup for winters",
          cokeTime: "30 min",
          people: 4,
          cokeName: "Izhar Badshah",
          aboutMoreCoking: "kg chicken, tbps kali mirch, salt to taste, Temater, Bari hari, lemmon",
        ),
        RecipesModel(
          title: "Super easy chiken Karhai",
          cokeTime: "50 min",
          people: 8,
          cokeName: "Hamza",
          aboutMoreCoking: "kg chicken, tbps kali mirch, salt to taste, Temater, Bari hari, lemmon",
        ),
        RecipesModel(
          title: "Quick and Easy Tomato Soup for winters",
          cokeTime: "30 min",
          people: 4,
          cokeName: "Izhar Badshah",
          aboutMoreCoking: "kg chicken, tbps kali mirch, salt to taste, Temater, Bari hari, lemmon",
        ),
        RecipesModel(
          title: "Quick and Easy Tomato Soup for winters",
          cokeTime: "30 min",
          people: 4,
          cokeName: "Izhar Badshah",
          aboutMoreCoking: "kg chicken, tbps kali mirch, salt to taste, Temater, Bari hari, lemmon",
        ),

      ],
        isLoading:  false
    );
  }
}
