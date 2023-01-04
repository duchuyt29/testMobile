// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'total_unread_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TotalUnreadResponse _$TotalUnreadResponseFromJson(Map<String, dynamic> json) =>
    TotalUnreadResponse(
      data: json['data'] == null
          ? null
          : TotalUnread.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..code = json['code'] as String?
      ..success = json['success'] as bool? ?? false
      ..title = json['title'] as String?
      ..message = json['message'] as String?;

Map<String, dynamic> _$TotalUnreadResponseToJson(
        TotalUnreadResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'success': instance.success,
      'title': instance.title,
      'message': instance.message,
      'data': instance.data,
    };
