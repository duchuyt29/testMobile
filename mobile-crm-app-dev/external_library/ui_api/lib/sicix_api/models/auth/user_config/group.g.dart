// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Group _$GroupFromJson(Map<String, dynamic> json) => Group(
      path: json['path'] as String?,
      code: json['code'] as String?,
      parentId: json['parent_id'] as int?,
      name: json['name'] as String?,
      id: json['id'] as int?,
      pathId: json['pathId'] as String?,
      type: json['type'] as String?,
    );

Map<String, dynamic> _$GroupToJson(Group instance) => <String, dynamic>{
      'path': instance.path,
      'code': instance.code,
      'parent_id': instance.parentId,
      'name': instance.name,
      'id': instance.id,
      'pathId': instance.pathId,
      'type': instance.type,
    };
