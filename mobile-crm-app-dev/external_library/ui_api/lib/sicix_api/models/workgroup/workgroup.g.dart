// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workgroup.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Workgroup _$WorkgroupFromJson(Map<String, dynamic> json) => Workgroup(
      createDate: json['createDate'] as String?,
      modifiedDate: json['modifiedDate'] as String?,
      version: json['version'] as int?,
      status: json['status'] as int?,
      companyId: json['companyId'] as int?,
      createBy: json['createBy'] as String?,
      updateBy: json['updateBy'] as String?,
      id: json['id'] as int?,
      groupId: json['groupId'] as int?,
      publishType: json['publishType'],
      attributes: json['attributes'] == null
          ? null
          : WorkgroupAttributes.fromJson(
              json['attributes'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WorkgroupToJson(Workgroup instance) => <String, dynamic>{
      'createDate': instance.createDate,
      'modifiedDate': instance.modifiedDate,
      'version': instance.version,
      'status': instance.status,
      'companyId': instance.companyId,
      'createBy': instance.createBy,
      'updateBy': instance.updateBy,
      'id': instance.id,
      'groupId': instance.groupId,
      'publishType': instance.publishType,
      'attributes': instance.attributes,
    };
