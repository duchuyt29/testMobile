// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_ws_active.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageWSActive _$MessageWSActiveFromJson(Map<String, dynamic> json) =>
    MessageWSActive(
      cmd: json['cmd'] as String?,
      convId: json['convId'] as int?,
      payload: json['payload'] == null
          ? null
          : MessageWSPayload.fromJson(json['payload'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MessageWSActiveToJson(MessageWSActive instance) =>
    <String, dynamic>{
      'cmd': instance.cmd,
      'convId': instance.convId,
      'payload': instance.payload,
    };

MessageWSPayload _$MessageWSPayloadFromJson(Map<String, dynamic> json) =>
    MessageWSPayload(
      type: json['type'] as String?,
    );

Map<String, dynamic> _$MessageWSPayloadToJson(MessageWSPayload instance) =>
    <String, dynamic>{
      'type': instance.type,
    };
