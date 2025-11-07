class GrammarCategory {
  final String name;
  final String content;
  final List<int> catIds;

  GrammarCategory({
    required this.name,
    required this.content,
    required this.catIds,
  });

  factory GrammarCategory.fromJson(Map<String, dynamic> json) {
    final catIdValue = json['CatID'];

    // Parse CatID safely into a List<int>
    List<int> parsedCatIds;
    if (catIdValue is int) {
      parsedCatIds = [catIdValue];
    } else if (catIdValue is String) {
      parsedCatIds = catIdValue
          .split(',')
          .map((e) => int.tryParse(e.trim()) ?? 0)
          .toList();
    } else if (catIdValue is Iterable) {
      parsedCatIds =
          catIdValue.map((e) => int.tryParse(e.toString()) ?? 0).toList();
    } else {
      parsedCatIds = [];
    }

    return GrammarCategory(
      name: json['CatName']?.toString() ?? '',
      content: json['Content']?.toString() ?? '',
      catIds: parsedCatIds,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'CatName': name,
      'Content': content,
      'CatID': catIds,
    };
  }
}
