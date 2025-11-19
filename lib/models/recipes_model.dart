class RecipesModel {
  final String? title;
  final String? cokeTime;
  final int? people;
  final String? cokeName;
  final String? aboutMoreCoking;
  final String? imageUrl;

  RecipesModel({
    required this.title,
    required this.cokeTime,
    required this.people,
    required this.cokeName,
    this.aboutMoreCoking,
    this.imageUrl,
  });
}
