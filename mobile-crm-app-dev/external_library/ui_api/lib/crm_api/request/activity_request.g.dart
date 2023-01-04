// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActivityRequest _$ActivityRequestFromJson(Map<String, dynamic> json) =>
    ActivityRequest(
      checkActivityTask: json['checkActivityTask'] as bool?,
      checkPermission: json['checkPermission'] as bool?,
      include:
          (json['include'] as List<dynamic>?)?.map((e) => e as String).toList(),
      props:
          (json['props'] as List<dynamic>?)?.map((e) => e as String).toList(),
      conditions: (json['conditions'] as List<dynamic>?)
          ?.map((e) => ActivityCondition.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ActivityRequestToJson(ActivityRequest instance) =>
    <String, dynamic>{
      'checkActivityTask': instance.checkActivityTask,
      'checkPermission': instance.checkPermission,
      'include': instance.include,
      'props': instance.props,
      'conditions': instance.conditions,
    };
