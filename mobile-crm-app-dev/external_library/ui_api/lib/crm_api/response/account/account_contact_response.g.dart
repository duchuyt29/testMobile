// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_contact_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountContactResponse _$AccountContactResponseFromJson(
        Map<String, dynamic> json) =>
    AccountContactResponse(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => AccountContact.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..code = json['code'] as String?
      ..success = json['success'] as bool? ?? false
      ..title = json['title'] as String?
      ..message = json['message'] as String?;

Map<String, dynamic> _$AccountContactResponseToJson(
        AccountContactResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'success': instance.success,
      'title': instance.title,
      'message': instance.message,
      'data': instance.data,
    };
