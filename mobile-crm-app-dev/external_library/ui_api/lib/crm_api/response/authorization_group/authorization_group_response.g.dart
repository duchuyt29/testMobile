// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authorization_group_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthorizationGroupResponse _$AuthorizationGroupResponseFromJson(
        Map<String, dynamic> json) =>
    AuthorizationGroupResponse(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => AuthorizationGroup.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..code = json['code'] as String?
      ..success = json['success'] as bool? ?? false
      ..title = json['title'] as String?
      ..message = json['message'] as String?;

Map<String, dynamic> _$AuthorizationGroupResponseToJson(
        AuthorizationGroupResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'success': instance.success,
      'title': instance.title,
      'message': instance.message,
      'data': instance.data,
    };
