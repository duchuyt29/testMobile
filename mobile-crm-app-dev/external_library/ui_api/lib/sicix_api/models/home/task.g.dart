// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Task _$TaskFromJson(Map<String, dynamic> json) => Task(
      createDate: json['createDate'] == null
          ? null
          : DateTime.parse(json['createDate'] as String),
      modifiedDate: json['modifiedDate'] == null
          ? null
          : DateTime.parse(json['modifiedDate'] as String),
      version: json['version'] as int?,
      status: json['status'] as int?,
      companyId: json['companyId'] == null
          ? null
          : CompanyHome.fromJson(json['companyId'] as Map<String, dynamic>),
      createBy: json['createBy'] == null
          ? null
          : User.fromJson(json['createBy'] as Map<String, dynamic>),
      updateBy: json['updateBy'] == null
          ? null
          : User.fromJson(json['updateBy'] as Map<String, dynamic>),
      id: json['id'] as int?,
      groupId: _convertGroupHome(json['groupId']),
      workflowId: json['workflowId'] as int?,
      activityId: json['activityId'] as int?,
      requestedBy: json['requestedBy'] == null
          ? null
          : User.fromJson(json['requestedBy'] as Map<String, dynamic>),
      name: json['name'] as String?,
      description: json['description'] as String?,
      startDate: json['startDate'] == null
          ? null
          : DateTime.parse(json['startDate'] as String),
      deadline: json['deadline'] == null
          ? null
          : DateTime.parse(json['deadline'] as String),
      type: json['type'] as String?,
      important: json['important'] as bool?,
      temp: json['temp'] as bool?,
      state: json['state'] as String?,
      parentId: json['parentId'] as int?,
      attachments: json['attachments'] as List<dynamic>?,
      showMore: json['showMore'] as bool?,
      useDelegate: json['useDelegate'] as bool?,
      showTitle: json['showTitle'] as bool?,
      referenceUrl: json['referenceUrl'] as String?,
      referenceId: json['referenceId'] as int?,
      publishDate: json['publishDate'] == null
          ? null
          : DateTime.parse(json['publishDate'] as String),
      reaction: json['reaction'] == null
          ? null
          : ReactionModel.fromJson(json['reaction'] as Map<String, dynamic>),
      polls: (json['polls'] as List<dynamic>?)
          ?.map((e) => Poll.fromJson(e as Map<String, dynamic>))
          .toList(),
      follow: json['follow'] as bool?,
      viewers: json['viewers'] == null
          ? null
          : Viewers.fromJson(json['viewers'] as Map<String, dynamic>),
      commentCount: json['commentCount'] as String?,
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$TaskToJson(Task instance) => <String, dynamic>{
      'createDate': instance.createDate?.toIso8601String(),
      'modifiedDate': instance.modifiedDate?.toIso8601String(),
      'version': instance.version,
      'status': instance.status,
      'companyId': instance.companyId,
      'createBy': instance.createBy,
      'updateBy': instance.updateBy,
      'id': instance.id,
      'groupId': instance.groupId,
      'workflowId': instance.workflowId,
      'activityId': instance.activityId,
      'requestedBy': instance.requestedBy,
      'name': instance.name,
      'description': instance.description,
      'startDate': instance.startDate?.toIso8601String(),
      'deadline': instance.deadline?.toIso8601String(),
      'type': instance.type,
      'important': instance.important,
      'temp': instance.temp,
      'state': instance.state,
      'parentId': instance.parentId,
      'attachments': instance.attachments,
      'showMore': instance.showMore,
      'useDelegate': instance.useDelegate,
      'showTitle': instance.showTitle,
      'referenceUrl': instance.referenceUrl,
      'referenceId': instance.referenceId,
      'publishDate': instance.publishDate?.toIso8601String(),
      'reaction': instance.reaction,
      'polls': instance.polls,
      'follow': instance.follow,
      'viewers': instance.viewers,
      'commentCount': instance.commentCount,
      'tags': instance.tags,
    };
