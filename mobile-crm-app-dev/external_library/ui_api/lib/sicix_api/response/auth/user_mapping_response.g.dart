// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_mapping_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserMappingResponse _$UserMappingResponseFromJson(Map<String, dynamic> json) =>
    UserMappingResponse(
      data: json['data'] == null
          ? null
          : UserMapping.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..code = json['code'] as String?
      ..success = json['success'] as bool? ?? false
      ..title = json['title'] as String?
      ..message = json['message'] as String?;

Map<String, dynamic> _$UserMappingResponseToJson(
        UserMappingResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'success': instance.success,
      'title': instance.title,
      'message': instance.message,
      'data': instance.data,
    };
