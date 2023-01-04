// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageItem _$MessageItemFromJson(Map<String, dynamic> json) => MessageItem(
      type: json['type'] as String?,
      createBy: json['create_by'] as String?,
      edit: json['edit'] as String?,
      meta: json['meta'],
      id: json['id'] as String?,
      createDate: _stringToDate(json['create_date']),
    );

Map<String, dynamic> _$MessageItemToJson(MessageItem instance) =>
    <String, dynamic>{
      'type': instance.type,
      'create_by': instance.createBy,
      'edit': instance.edit,
      'meta': instance.meta,
      'id': instance.id,
      'create_date': instance.createDate?.toIso8601String(),
    };
