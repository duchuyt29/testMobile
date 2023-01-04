// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_infos_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserInfosResponse _$UserInfosResponseFromJson(Map<String, dynamic> json) =>
    UserInfosResponse(
      data: json['data'] == null
          ? null
          : UserInfos.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..code = json['code'] as String?
      ..success = json['success'] as bool? ?? false
      ..title = json['title'] as String?
      ..message = json['message'] as String?;

Map<String, dynamic> _$UserInfosResponseToJson(UserInfosResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'success': instance.success,
      'title': instance.title,
      'message': instance.message,
      'data': instance.data,
    };
