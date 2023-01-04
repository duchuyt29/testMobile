// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_message_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchMessageData _$SearchMessageDataFromJson(Map<String, dynamic> json) =>
    SearchMessageData(
      current: json['current'] == null
          ? null
          : Current.fromJson(json['current'] as Map<String, dynamic>),
      payload: json['payload'] == null
          ? null
          : Payload.fromJson(json['payload'] as Map<String, dynamic>),
      conversation: json['conversation'] == null
          ? null
          : LastMessage.fromJson(json['conversation'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SearchMessageDataToJson(SearchMessageData instance) =>
    <String, dynamic>{
      'current': instance.current,
      'payload': instance.payload,
      'conversation': instance.conversation,
    };
