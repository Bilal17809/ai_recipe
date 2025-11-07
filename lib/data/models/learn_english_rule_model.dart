class LearnEnglishRuleModel {
  final int ruleID;
  final int catID;
  final String content;
  final String ruleName;
  LearnEnglishRuleModel({
    required this.ruleID,
    required this.catID,
    required this.ruleName,
    required this.content,
  });

  factory LearnEnglishRuleModel.fromJson(Map<String, dynamic> json) {
    return LearnEnglishRuleModel(
      ruleID: json['RuleID'] ?? '',
      catID: json['CatID'] ?? '',
      ruleName: json['RuleName'] ?? '',
      content: json['Content'] ?? '',
    );
  }
}

class GrammarQuizDetail {
  final int quizDetailID;
  final int quizID;
  final String content;
  final String code;

  GrammarQuizDetail({
    required this.quizID,
    required this.quizDetailID,
    required this.code,
    required this.content,
  });

  factory GrammarQuizDetail.fromJson(Map<String, dynamic> json) {
    return GrammarQuizDetail(
      quizDetailID: json['QuizDetailID'] ?? '',
      quizID: json['QuizID'] ?? '',
      content: json['Content'] ?? '',
      code: json['Code'] ?? '',
    );
  }
}
