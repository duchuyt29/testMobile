// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_pin.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessagePin _$MessagePinFromJson(Map<String, dynamic> json) => MessagePin(
      pinId: json['pin_id'] as int?,
      id: json['id'] as String?,
      createBy: json['create_by'] as String?,
      type: json['type'] as String?,
      meta: json['meta'],
      content: json['content'] as String?,
      pinDate: json['pin_date'] as String?,
      createDate: json['create_date'] as String?,
    );

Map<String, dynamic> _$MessagePinToJson(MessagePin instance) =>
    <String, dynamic>{
      'pin_id': instance.pinId,
      'id': instance.id,
      'create_by': instance.createBy,
      'type': instance.type,
      'meta': instance.meta,
      'content': instance.content,
      'pin_date': instance.pinDate,
      'create_date': instance.createDate,
    };

MessagePins _$MessagePinsFromJson(Map<String, dynamic> json) => MessagePins(
      (json['content'] as List<dynamic>?)
              ?.map((e) => MessagePin.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    )
      ..pageSize = json['pageSize'] as int?
      ..page = json['page'] as int?
      ..total = json['total'] as int?;

Map<String, dynamic> _$MessagePinsToJson(MessagePins instance) =>
    <String, dynamic>{
      'pageSize': instance.pageSize,
      'page': instance.page,
      'total': instance.total,
      'content': instance.content,
    };
