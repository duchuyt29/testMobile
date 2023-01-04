// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_conversation_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateConversationResponse _$CreateConversationResponseFromJson(
        Map<String, dynamic> json) =>
    CreateConversationResponse(
      data: json['data'] == null
          ? null
          : ConversationCreated.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..code = json['code'] as String?
      ..success = json['success'] as bool? ?? false
      ..title = json['title'] as String?
      ..message = json['message'] as String?;

Map<String, dynamic> _$CreateConversationResponseToJson(
        CreateConversationResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'success': instance.success,
      'title': instance.title,
      'message': instance.message,
      'data': instance.data,
    };
