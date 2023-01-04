// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_message_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetMessageData _$GetMessageDataFromJson(Map<String, dynamic> json) =>
    GetMessageData(
      current: json['current'] == null
          ? null
          : Current.fromJson(json['current'] as Map<String, dynamic>),
      payload: (json['payload'] as List<dynamic>?)
          ?.map((e) => MessageItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      conversation: json['conversation'] == null
          ? null
          : LastMessage.fromJson(json['conversation'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetMessageDataToJson(GetMessageData instance) =>
    <String, dynamic>{
      'current': instance.current,
      'payload': instance.payload,
      'conversation': instance.conversation,
    };
