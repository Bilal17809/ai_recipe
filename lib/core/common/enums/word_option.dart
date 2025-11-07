enum WordOption {
  question('question'),
  correct('correct'),
  incorrect('incorrect'),
  notAnswered('notAnswered');

  final String value;

  const WordOption(this.value);

  static WordOption fromString(String value) {
    return WordOption.values.firstWhere(
          (e) => e.value == value,
      orElse: () => WordOption.notAnswered,
    );
  }

  @override
  String toString() => value;
}
