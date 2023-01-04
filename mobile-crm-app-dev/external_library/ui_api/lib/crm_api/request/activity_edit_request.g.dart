// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_edit_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActivityEditRequest _$ActivityEditRequestFromJson(Map<String, dynamic> json) =>
    ActivityEditRequest(
      task: json['task'] == null
          ? null
          : ActivityCreateTask.fromJson(json['task'] as Map<String, dynamic>),
      involves: (json['involves'] as List<dynamic>?)
          ?.map(
              (e) => ActivityCreateInvolve.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ActivityEditRequestToJson(
        ActivityEditRequest instance) =>
    <String, dynamic>{
      'task': instance.task,
      'involves': instance.involves,
    };
