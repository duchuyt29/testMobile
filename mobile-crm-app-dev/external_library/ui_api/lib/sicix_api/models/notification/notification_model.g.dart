// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationModel _$NotificationModelFromJson(Map<String, dynamic> json) =>
    NotificationModel(
      json['subject'] as String?,
      json['id'] as String?,
      json['content'] as String?,
      json['createDate'] == null
          ? null
          : DateTime.parse(json['createDate'] as String),
      json['status'] as int?,
    );

Map<String, dynamic> _$NotificationModelToJson(NotificationModel instance) =>
    <String, dynamic>{
      'subject': instance.subject,
      'id': instance.id,
      'content': instance.content,
      'createDate': instance.createDate?.toIso8601String(),
      'status': instance.status,
    };

NotificationModels _$NotificationModelsFromJson(Map<String, dynamic> json) =>
    NotificationModels(
      (json['content'] as List<dynamic>?)
              ?.map(
                  (e) => NotificationModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      json['unread'] as int?,
    )
      ..pageSize = json['pageSize'] as int?
      ..page = json['page'] as int?
      ..total = json['total'] as int?;

Map<String, dynamic> _$NotificationModelsToJson(NotificationModels instance) =>
    <String, dynamic>{
      'pageSize': instance.pageSize,
      'page': instance.page,
      'total': instance.total,
      'content': instance.content,
      'unread': instance.unread,
    };
