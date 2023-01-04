// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation_created.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConversationCreated _$ConversationCreatedFromJson(Map<String, dynamic> json) =>
    ConversationCreated(
      name: json['name'] as String?,
      id: json['id'] as int?,
      type: json['type'] as String?,
      msgType: json['msg_type'] as String?,
      msgBy: json['msg_by'] as String?,
      msgContent: json['msg_content'] as String?,
      partner: json['partner'] as String?,
      modifiedDate: json['modified_date'] as String?,
      avatar: json['avatar'] as String?,
      config: json['config'],
    );

Map<String, dynamic> _$ConversationCreatedToJson(
        ConversationCreated instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'type': instance.type,
      'msg_type': instance.msgType,
      'msg_by': instance.msgBy,
      'msg_content': instance.msgContent,
      'partner': instance.partner,
      'modified_date': instance.modifiedDate,
      'avatar': instance.avatar,
      'config': instance.config,
    };
