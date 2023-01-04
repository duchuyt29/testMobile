// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_account_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActivityAccountResponse _$ActivityAccountResponseFromJson(
        Map<String, dynamic> json) =>
    ActivityAccountResponse(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => ActivityAccount.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..code = json['code'] as String?
      ..success = json['success'] as bool? ?? false
      ..title = json['title'] as String?
      ..message = json['message'] as String?;

Map<String, dynamic> _$ActivityAccountResponseToJson(
        ActivityAccountResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'success': instance.success,
      'title': instance.title,
      'message': instance.message,
      'data': instance.data,
    };
