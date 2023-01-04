// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'avatar_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AvatarResponse _$AvatarResponseFromJson(Map<String, dynamic> json) =>
    AvatarResponse(
      avatarModel: json['data'] == null
          ? null
          : UserInfo.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..code = json['code'] as String?
      ..success = json['success'] as bool? ?? false
      ..title = json['title'] as String?
      ..message = json['message'] as String?;

Map<String, dynamic> _$AvatarResponseToJson(AvatarResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'success': instance.success,
      'title': instance.title,
      'message': instance.message,
      'data': instance.avatarModel,
    };
