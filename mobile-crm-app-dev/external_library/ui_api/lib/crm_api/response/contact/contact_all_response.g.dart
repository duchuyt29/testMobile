// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_all_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContactAllResponse _$ContactAllResponseFromJson(Map<String, dynamic> json) =>
    ContactAllResponse(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Contact.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..code = json['code'] as String?
      ..success = json['success'] as bool? ?? false
      ..title = json['title'] as String?
      ..message = json['message'] as String?;

Map<String, dynamic> _$ContactAllResponseToJson(ContactAllResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'success': instance.success,
      'title': instance.title,
      'message': instance.message,
      'data': instance.data,
    };
