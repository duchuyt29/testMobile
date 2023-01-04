// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accounts_all_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountAllResponse _$AccountAllResponseFromJson(Map<String, dynamic> json) =>
    AccountAllResponse(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => AccountInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..code = json['code'] as String?
      ..success = json['success'] as bool? ?? false
      ..title = json['title'] as String?
      ..message = json['message'] as String?;

Map<String, dynamic> _$AccountAllResponseToJson(AccountAllResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'success': instance.success,
      'title': instance.title,
      'message': instance.message,
      'data': instance.data,
    };
