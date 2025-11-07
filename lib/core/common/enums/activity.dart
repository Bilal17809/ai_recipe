enum ActivityType {
  quiz('quiz'),
  word('word'),
  translation('translation');

  final String value;

  const ActivityType(this.value);

  @override
  String toString() => value;

  static ActivityType fromString(String label) {
    return ActivityType.values.firstWhere(
          (e) => e.value == label,
      orElse: () => ActivityType.word,
    );
  }
}
