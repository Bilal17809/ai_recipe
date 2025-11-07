enum AppTheme {
  light('light'),
  dark('dark'),
  system('system');

  final String value;
  const AppTheme(this.value);

  static AppTheme fromString(String value) {
    return AppTheme.values.firstWhere(
          (e) => e.value == value,
      orElse: () => AppTheme.system,
    );
  }

  @override
  String toString() => value;
}