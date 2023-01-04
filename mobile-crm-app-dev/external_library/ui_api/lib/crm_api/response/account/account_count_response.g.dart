// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_count_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountCountResponse _$AccountCountResponseFromJson(
        Map<String, dynamic> json) =>
    AccountCountResponse(
      data: json['data'] == null
          ? null
          : AccountCount.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..code = json['code'] as String?
      ..success = json['success'] as bool? ?? false
      ..title = json['title'] as String?
      ..message = json['message'] as String?;

Map<String, dynamic> _$AccountCountResponseToJson(
        AccountCountResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'success': instance.success,
      'title': instance.title,
      'message': instance.message,
      'data': instance.data,
    };
