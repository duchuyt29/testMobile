// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_create_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActivityCreateRequest _$ActivityCreateRequestFromJson(
        Map<String, dynamic> json) =>
    ActivityCreateRequest(
      task: json['task'] == null
          ? null
          : ActivityCreateTask.fromJson(json['task'] as Map<String, dynamic>),
      involves: (json['involves'] as List<dynamic>?)
          ?.map(
              (e) => ActivityCreateInvolve.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ActivityCreateRequestToJson(
        ActivityCreateRequest instance) =>
    <String, dynamic>{
      'task': instance.task,
      'involves': instance.involves,
    };
