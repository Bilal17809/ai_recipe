import 'package:ai_recipe/core/common/loading.dart';
import 'package:ai_recipe/pages/recipes/widgets/recipes.dart';
import 'package:ai_recipe/pages/recipes/widgets/search_recipes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/core/theme/app_colors.dart';
import '/core/theme/app_styles.dart';
import '../providers/recipes_notifiers.dart';

class RecipesView extends ConsumerWidget {
  const RecipesView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recipesState = ref.watch(recipesNotifiersProvider);

    return Scaffold(
      backgroundColor: kWhiteF7,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: appColorDeepPurple,
        title: Text(
          'My Recipes',
          style: titleLargeStyle.copyWith(color: kWhite),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 18),
            const SearchRecipes(),
            const SizedBox(height: 10),
            if (recipesState.isLoading)
              Expanded(child: Center(child: ShowLoading()))
            else if (recipesState.recipesList.isEmpty)
              Expanded(
                child: Center(
                  child: Text(
                    recipesState.errorMessage ?? "No Recipes Found",
                    style: titleSmallStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            else
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  itemCount: recipesState.recipesList.length + 1,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Text(
                          "Latest Recipes",
                          style: titleSmallStyle.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      );
                    }
                    final recipe = recipesState.recipesList[index - 1];
                    return GestureDetector(
                      onTap: () {},
                      child: Recipes(recipesList: recipe),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
