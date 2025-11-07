enum Difficulty {
  easy('easy'),
  medium('medium'),
  hard('hard');

  final String value;

  const Difficulty(this.value);

  static Difficulty fromString(String value) {
    return Difficulty.values.firstWhere(
      (e) => e.value == value,
      orElse: () => Difficulty.easy,
    );
  }

  @override
  String toString() => value;
}
