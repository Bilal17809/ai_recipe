class LanguageModel {
  final String name;
  final String alpha2Code;
  final String locale;
  final String language;
  final String flag;
  LanguageModel({
    required this.name,
    required this.alpha2Code,
    required this.locale,
    required this.language,
    required this.flag,
  });
  factory LanguageModel.fromJson(Map<String, dynamic> json) {
    final flags = {
      "US": "🇺🇸",
      "DE": "🇩🇪",
      "IN": "🇮🇳",
      "JP": "🇯🇵",
      "FR": "🇫🇷",
      "IT": "🇮🇹",
      "PK": "🇵🇰",
      "BR": "🇧🇷",
      "MX": "🇲🇽",
      "CN": "🇨🇳",
      "KR": "🇰🇷",
      "RU": "🇷🇺",
      "ES": "🇪🇸",
      "NL": "🇳🇱",
      "CH": "🇨🇭",
      "TR": "🇹🇷",
      "SA": "🇸🇦",
      "PT": "🇵🇹",
      "IL": "🇮🇱",
    };
    return LanguageModel(
      name: json["name"],
      alpha2Code: json["alpha2Code"],
      locale: json["locale"],
      language: json["language"],
      flag: flags[json["alpha2Code"]] ?? "🏳️",
    );
  }
}
