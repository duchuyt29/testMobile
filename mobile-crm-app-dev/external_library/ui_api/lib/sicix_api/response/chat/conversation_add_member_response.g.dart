// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation_add_member_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConversationAddMemberResponse _$ConversationAddMemberResponseFromJson(
        Map<String, dynamic> json) =>
    ConversationAddMemberResponse(
      data: json['data'] == null
          ? null
          : ConversationAddMember.fromJson(
              json['data'] as Map<String, dynamic>),
    )
      ..code = json['code'] as String?
      ..success = json['success'] as bool? ?? false
      ..title = json['title'] as String?
      ..message = json['message'] as String?;

Map<String, dynamic> _$ConversationAddMemberResponseToJson(
        ConversationAddMemberResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'success': instance.success,
      'title': instance.title,
      'message': instance.message,
      'data': instance.data,
    };
