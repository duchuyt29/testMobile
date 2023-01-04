// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'birth_month_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BirthMonthResponse _$BirthMonthResponseFromJson(Map<String, dynamic> json) =>
    BirthMonthResponse(
      (json['data'] as List<dynamic>?)
              ?.map((e) => UserInfo.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    )
      ..code = json['code'] as String?
      ..success = json['success'] as bool? ?? false
      ..title = json['title'] as String?
      ..message = json['message'] as String?;

Map<String, dynamic> _$BirthMonthResponseToJson(BirthMonthResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'success': instance.success,
      'title': instance.title,
      'message': instance.message,
      'data': instance.data,
    };
