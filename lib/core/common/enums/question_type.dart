enum QuestionType {
  multiple('multiple'),
  boolean('boolean');

  final String value;

  const QuestionType(this.value);

  @override
  String toString() {
    return value;
  }

  static QuestionType fromString(String value) {
    return QuestionType.values.firstWhere(
      (e) => e.value == value,
      orElse: () => QuestionType.multiple,
    );
  }
}
