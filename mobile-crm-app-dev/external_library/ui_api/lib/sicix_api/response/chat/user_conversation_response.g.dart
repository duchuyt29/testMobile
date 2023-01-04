// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_conversation_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserConversationResponse _$UserConversationResponseFromJson(
        Map<String, dynamic> json) =>
    UserConversationResponse(
      data: json['data'] == null
          ? null
          : UserConversations.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..code = json['code'] as String?
      ..success = json['success'] as bool? ?? false
      ..title = json['title'] as String?
      ..message = json['message'] as String?;

Map<String, dynamic> _$UserConversationResponseToJson(
        UserConversationResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'success': instance.success,
      'title': instance.title,
      'message': instance.message,
      'data': instance.data,
    };
