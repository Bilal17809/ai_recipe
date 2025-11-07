class UserMessage {
  final String role;
  final String content;

  const UserMessage({required this.role, required this.content});

  factory UserMessage.fromJson(Map<String, dynamic> json) {
    return UserMessage(
      role: json['role'] ?? '',
      content: json['content'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {'role': role, 'content': content};
  }

  UserMessage copyWith({String? role, String? content}) {
    return UserMessage(
      role: role ?? this.role,
      content: content ?? this.content,
    );
  }
}

class UserRequest {
  final String model;
  final List<UserMessage> messages;
  final double temperature;
  final int maxTokens;

  const UserRequest({
    required this.model,
    required this.messages,
    this.temperature = 0.7,
    this.maxTokens = 200,
  });

  factory UserRequest.fromJson(Map<String, dynamic> json) {
    final messagesJson = json['messages'] as List<dynamic>? ?? [];

    final messages = messagesJson
        .map((e) => UserMessage.fromJson(e as Map<String, dynamic>))
        .toList();

    return UserRequest(
      model: json['model'] ?? '',
      messages: messages,
      temperature: json['temperature'] ?? 0.0,
      maxTokens: json['max_tokens'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'model': model,
      'messages': messages.map((e) => e.toJson()).toList(),
      'temperature': temperature,
      'max_tokens': maxTokens,
    };
  }

  UserRequest copyWith({
    String? model,
    List<UserMessage>? messages,
    double? temperature,
    int? maxTokens,
  }) {
    return UserRequest(
      model: model ?? this.model,
      messages: messages ?? this.messages,
      temperature: temperature ?? this.temperature,
      maxTokens: maxTokens ?? this.maxTokens,
    );
  }
}
