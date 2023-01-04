// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'avatar_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AvatarModel _$AvatarModelFromJson(Map<String, dynamic> json) => AvatarModel(
      createDate: json['createDate'] == null
          ? null
          : DateTime.parse(json['createDate'] as String),
      modifiedDate: json['modifiedDate'] == null
          ? null
          : DateTime.parse(json['modifiedDate'] as String),
      version: json['version'] as int?,
      status: json['status'] as int?,
      companyId: json['companyId'] as int?,
      createBy: json['createBy'] as String?,
      updateBy: json['updateBy'] as String?,
      id: json['id'] as String?,
      username: json['username'] as String?,
      email: json['email'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      middleName: json['middleName'] as String?,
      avatar: json['avatar'] as String?,
      state: json['state'] as String?,
      locale: json['locale'] as String?,
      fullName: json['fullName'] as String?,
    );

Map<String, dynamic> _$AvatarModelToJson(AvatarModel instance) =>
    <String, dynamic>{
      'createDate': instance.createDate?.toIso8601String(),
      'modifiedDate': instance.modifiedDate?.toIso8601String(),
      'version': instance.version,
      'status': instance.status,
      'companyId': instance.companyId,
      'createBy': instance.createBy,
      'updateBy': instance.updateBy,
      'id': instance.id,
      'username': instance.username,
      'email': instance.email,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'middleName': instance.middleName,
      'avatar': instance.avatar,
      'state': instance.state,
      'locale': instance.locale,
      'fullName': instance.fullName,
    };
