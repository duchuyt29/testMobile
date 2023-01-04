// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_contact_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActivityContactResponse _$ActivityContactResponseFromJson(
        Map<String, dynamic> json) =>
    ActivityContactResponse(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => ActivityContact.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..code = json['code'] as String?
      ..success = json['success'] as bool? ?? false
      ..title = json['title'] as String?
      ..message = json['message'] as String?;

Map<String, dynamic> _$ActivityContactResponseToJson(
        ActivityContactResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'success': instance.success,
      'title': instance.title,
      'message': instance.message,
      'data': instance.data,
    };
