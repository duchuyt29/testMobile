import 'package:json_annotation/json_annotation.dart';

import '../models/chat/conversation/conversation_theme.dart';

part 'conversation_theme_request.g.dart';

@JsonSerializable()
class ConversationThemeRequest {
  @JsonKey(name: 'config')
  final ConversationTheme? theme;

  ConversationThemeRequest(this.theme);

  factory ConversationThemeRequest.fromJson(Map<String, dynamic> json) =>
      _$ConversationThemeRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ConversationThemeRequestToJson(this);
}
