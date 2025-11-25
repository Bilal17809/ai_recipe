class Recipe {
  final String title;
  final List<String>? ingredients;
  final List<String>? steps;

  Recipe({required this.title, required this.ingredients, required this.steps});
}



class RecipeModelForMistral {
  final String title;
  final List<String>? ingredients;
  final List<String>? steps;
  final int? cookingTime;
  final int? servings;

  RecipeModelForMistral({
    required this.title,
    this.ingredients,
    this.steps,
    this.cookingTime,
    this.servings,
  });

  factory RecipeModelForMistral.fromJson(Map<String, dynamic> json) {

    final ingredients = (json['ingredients'] as List?)?.map((e) => e.toString()).toList();
    final steps = (json['steps'] as List?)?.map((e) => e.toString()).toList();
    final cookingTime = json['cookingTime'] != null ? int.tryParse(json['cookingTime'].toString()) : null;
    final servings = json['servings'] != null ? int.tryParse(json['servings'].toString()) : null;
    final title = json['title']?.toString() ?? 'Recipe';

    return RecipeModelForMistral(
      title: title,
      ingredients: ingredients,
      steps: steps,
      cookingTime: cookingTime,
      servings: servings,
    );
  }

  Map<String, dynamic> toJson() => {
    'title': title,
    'ingredients': ingredients,
    'steps': steps,
    'cookingTime': cookingTime,
    'servings': servings,
  };
}
