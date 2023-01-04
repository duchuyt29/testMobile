// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workgroup_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkgroupResponse _$WorkgroupResponseFromJson(Map<String, dynamic> json) =>
    WorkgroupResponse(
      json['data'] == null
          ? null
          : Workgroup.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..code = json['code'] as String?
      ..success = json['success'] as bool? ?? false
      ..title = json['title'] as String?
      ..message = json['message'] as String?;

Map<String, dynamic> _$WorkgroupResponseToJson(WorkgroupResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'success': instance.success,
      'title': instance.title,
      'message': instance.message,
      'data': instance.data,
    };
