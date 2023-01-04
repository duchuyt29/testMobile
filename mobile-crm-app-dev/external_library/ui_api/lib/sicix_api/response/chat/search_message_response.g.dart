// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_message_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchMessageResponse _$SearchMessageResponseFromJson(
        Map<String, dynamic> json) =>
    SearchMessageResponse(
      data: json['data'] == null
          ? null
          : SearchMessageData.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..code = json['code'] as String?
      ..success = json['success'] as bool? ?? false
      ..title = json['title'] as String?
      ..message = json['message'] as String?;

Map<String, dynamic> _$SearchMessageResponseToJson(
        SearchMessageResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'success': instance.success,
      'title': instance.title,
      'message': instance.message,
      'data': instance.data,
    };
