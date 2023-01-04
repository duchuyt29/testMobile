// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'permission_action.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PermissionAction _$PermissionActionFromJson(Map<String, dynamic> json) =>
    PermissionAction(
      view: json['view'] == null
          ? null
          : ScreenRule.fromJson(json['view'] as Map<String, dynamic>),
      viewTask: json['view_task'] == null
          ? null
          : ScreenRule.fromJson(json['view_task'] as Map<String, dynamic>),
      update: json['update'] == null
          ? null
          : ScreenRule.fromJson(json['update'] as Map<String, dynamic>),
      updateTask: json['update_task'] == null
          ? null
          : ScreenRule.fromJson(json['update_task'] as Map<String, dynamic>),
      create: json['create'] == null
          ? null
          : ScreenRule.fromJson(json['create'] as Map<String, dynamic>),
      createTask: json['create_task'] == null
          ? null
          : ScreenRule.fromJson(json['create_task'] as Map<String, dynamic>),
      delete: json['delete'] == null
          ? null
          : ScreenRule.fromJson(json['delete'] as Map<String, dynamic>),
      deleteTask: json['delete_task'] == null
          ? null
          : ScreenRule.fromJson(json['delete_task'] as Map<String, dynamic>),
      changeStateTask: json['change_state_task'] == null
          ? null
          : ScreenRule.fromJson(
              json['change_state_task'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PermissionActionToJson(PermissionAction instance) =>
    <String, dynamic>{
      'view': instance.view,
      'view_task': instance.viewTask,
      'update': instance.update,
      'update_task': instance.updateTask,
      'create': instance.create,
      'create_task': instance.createTask,
      'delete': instance.delete,
      'delete_task': instance.deleteTask,
      'change_state_task': instance.changeStateTask,
    };
