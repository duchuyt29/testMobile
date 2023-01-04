// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authorization_group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthorizationGroup _$AuthorizationGroupFromJson(Map<String, dynamic> json) =>
    AuthorizationGroup(
      id: json['id'] as int?,
      authorizationGroupName: json['authorizationGroupName'] as String?,
      authorizationGroupCode: json['authorizationGroupCode'] as String?,
      status: json['status'] as int?,
    );

Map<String, dynamic> _$AuthorizationGroupToJson(AuthorizationGroup instance) =>
    <String, dynamic>{
      'id': instance.id,
      'authorizationGroupName': instance.authorizationGroupName,
      'authorizationGroupCode': instance.authorizationGroupCode,
      'status': instance.status,
    };
