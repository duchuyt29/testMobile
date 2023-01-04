// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_content_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageContentEvent _$MessageContentEventFromJson(Map<String, dynamic> json) =>
    MessageContentEvent(
      name: json['name'] as String?,
      type: json['type'] as String?,
      createBy: json['createBy'] as String?,
      participant: (json['participant'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    )
      ..pinId = json['pin_id'] as int?
      ..id = json['id'] as String?
      ..content = json['content'] as String?
      ..msgType = json['msgType'] as String?
      ..createDate = json['create_date'] as int?;

Map<String, dynamic> _$MessageContentEventToJson(
        MessageContentEvent instance) =>
    <String, dynamic>{
      'type': instance.type,
      'createBy': instance.createBy,
      'name': instance.name,
      'participant': instance.participant,
      'pin_id': instance.pinId,
      'id': instance.id,
      'content': instance.content,
      'msgType': instance.msgType,
      'create_date': instance.createDate,
    };
