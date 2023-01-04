// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_account_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContactAccountResponse _$ContactAccountResponseFromJson(
        Map<String, dynamic> json) =>
    ContactAccountResponse(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => ContactAccount.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..code = json['code'] as String?
      ..success = json['success'] as bool? ?? false
      ..title = json['title'] as String?
      ..message = json['message'] as String?;

Map<String, dynamic> _$ContactAccountResponseToJson(
        ContactAccountResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'success': instance.success,
      'title': instance.title,
      'message': instance.message,
      'data': instance.data,
    };
