enum ChatRole {
  user('user'),
  system('system');

  final String value;

  const ChatRole(this.value);

  @override
  String toString() => value;

  static ChatRole fromString(String value) {
    return ChatRole.values.firstWhere(
      (e) => e.value == value,
      orElse: () => ChatRole.user,
    );
  }
}
