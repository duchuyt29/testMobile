// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation_theme_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConversationThemeRequest _$ConversationThemeRequestFromJson(
        Map<String, dynamic> json) =>
    ConversationThemeRequest(
      json['config'] == null
          ? null
          : ConversationTheme.fromJson(json['config'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ConversationThemeRequestToJson(
        ConversationThemeRequest instance) =>
    <String, dynamic>{
      'config': instance.theme,
    };
