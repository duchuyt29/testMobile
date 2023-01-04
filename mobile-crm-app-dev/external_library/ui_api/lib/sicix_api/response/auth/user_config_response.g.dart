// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_config_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserConfigResponse _$UserConfigResponseFromJson(Map<String, dynamic> json) =>
    UserConfigResponse(
      data: json['data'] == null
          ? null
          : UserConfig.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..code = json['code'] as String?
      ..success = json['success'] as bool? ?? false
      ..title = json['title'] as String?
      ..message = json['message'] as String?;

Map<String, dynamic> _$UserConfigResponseToJson(UserConfigResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'success': instance.success,
      'title': instance.title,
      'message': instance.message,
      'data': instance.data,
    };
