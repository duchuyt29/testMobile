// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_pin_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessagePinResponse _$MessagePinResponseFromJson(Map<String, dynamic> json) =>
    MessagePinResponse(
      data: json['data'] == null
          ? null
          : MessagePins.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..code = json['code'] as String?
      ..success = json['success'] as bool? ?? false
      ..title = json['title'] as String?
      ..message = json['message'] as String?;

Map<String, dynamic> _$MessagePinResponseToJson(MessagePinResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'success': instance.success,
      'title': instance.title,
      'message': instance.message,
      'data': instance.data,
    };
