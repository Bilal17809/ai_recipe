class RecipeModel {
  final String title;
  final List<String> ingredients;
  final List<String> steps;

  RecipeModel({
    required this.title,
    required this.ingredients,
    required this.steps,
  });

  factory RecipeModel.fromJson(Map<String, dynamic> json) {
    final ingredients = (json["extendedIngredients"] as List?)
        ?.map((e) => e["original"].toString())
        .toList()
        ?? [];

    // STEPS (FIXED)
    final List<String> steps = [];

    if (json["analyzedInstructions"] is List &&
        (json["analyzedInstructions"] as List).isNotEmpty) {
      final firstInstruction = json["analyzedInstructions"][0];

      if (firstInstruction["steps"] is List) {
        steps.addAll(
          (firstInstruction["steps"] as List)
              .map((s) => s["step"].toString())
              .toList(),
        );
      }
    }

    return RecipeModel(
      title: json["title"] ?? "Unknown Dish",
      ingredients: ingredients,
      steps: steps,
    );
  }
}
