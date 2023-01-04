// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_mapping.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserMapping _$UserMappingFromJson(Map<String, dynamic> json) => UserMapping(
      orgName: json['orgName'] as String?,
      gender: json['gender'] as String?,
      level: json['level'],
      workEmail: json['workEmail'] as String?,
      fullName: json['fullName'] as String?,
      id: json['id'] as int?,
      avatar: json['avatar'] as String?,
      position: json['position'] as String?,
      empNo: json['empNo'] as String?,
      title: json['title'] as String?,
      orgId: json['orgId'] as int?,
      status: json['status'] as int?,
    );

Map<String, dynamic> _$UserMappingToJson(UserMapping instance) =>
    <String, dynamic>{
      'orgName': instance.orgName,
      'gender': instance.gender,
      'level': instance.level,
      'workEmail': instance.workEmail,
      'fullName': instance.fullName,
      'id': instance.id,
      'avatar': instance.avatar,
      'position': instance.position,
      'empNo': instance.empNo,
      'title': instance.title,
      'orgId': instance.orgId,
      'status': instance.status,
    };
