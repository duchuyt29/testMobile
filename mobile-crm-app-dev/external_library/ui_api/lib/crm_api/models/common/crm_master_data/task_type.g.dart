// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaskType _$TaskTypeFromJson(Map<String, dynamic> json) => TaskType(
      taskTypeName: json['taskTypeName'] as String?,
      id: json['id'] as int?,
      status: json['status'] as int?,
    );

Map<String, dynamic> _$TaskTypeToJson(TaskType instance) => <String, dynamic>{
      'taskTypeName': instance.taskTypeName,
      'id': instance.id,
      'status': instance.status,
    };
