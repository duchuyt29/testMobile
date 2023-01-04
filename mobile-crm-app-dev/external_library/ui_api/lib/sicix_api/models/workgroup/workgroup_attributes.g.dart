// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workgroup_attributes.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkgroupAttributes _$WorkgroupAttributesFromJson(Map<String, dynamic> json) =>
    WorkgroupAttributes(
      post: json['POST'] == null
          ? null
          : WorkgroupAttribute.fromJson(json['POST'] as Map<String, dynamic>),
      event: json['EVENT'] == null
          ? null
          : WorkgroupAttribute.fromJson(json['EVENT'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WorkgroupAttributesToJson(
        WorkgroupAttributes instance) =>
    <String, dynamic>{
      'POST': instance.post,
      'EVENT': instance.event,
    };
