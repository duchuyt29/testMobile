// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Comment _$CommentFromJson(Map<String, dynamic> json) => Comment(
      id: json['id'] as String?,
      companyId: json['companyId'] as int?,
      createBy: json['createBy'] == null
          ? null
          : User.fromJson(json['createBy'] as Map<String, dynamic>),
      createDate: json['createDate'] == null
          ? null
          : DateTime.parse(json['createDate'] as String),
      modifiedDate: json['modifiedDate'] == null
          ? null
          : DateTime.parse(json['modifiedDate'] as String),
      type: json['type'] as String?,
      parentId: json['parentId'] as String?,
      content: json['content'] as String?,
      attachments: (json['attachments'] as List<dynamic>?)
              ?.map((e) => MediaFile.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      subComments: (json['subComments'] as List<dynamic>?)
              ?.map((e) => Comment.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      reaction: json['reaction'] == null
          ? null
          : ReactionModel.fromJson(json['reaction'] as Map<String, dynamic>),
    )..childrenQuantity = json['childrenQuantity'] as int?;

Map<String, dynamic> _$CommentToJson(Comment instance) => <String, dynamic>{
      'id': instance.id,
      'companyId': instance.companyId,
      'createBy': instance.createBy,
      'createDate': instance.createDate?.toIso8601String(),
      'modifiedDate': instance.modifiedDate?.toIso8601String(),
      'type': instance.type,
      'parentId': instance.parentId,
      'childrenQuantity': instance.childrenQuantity,
      'content': instance.content,
      'attachments': instance.attachments,
      'subComments': instance.subComments,
      'reaction': instance.reaction,
    };

Comments _$CommentsFromJson(Map<String, dynamic> json) => Comments(
      (json['content'] as List<dynamic>?)
              ?.map((e) => Comment.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    )
      ..pageSize = json['pageSize'] as int?
      ..page = json['page'] as int?
      ..total = json['total'] as int?;

Map<String, dynamic> _$CommentsToJson(Comments instance) => <String, dynamic>{
      'pageSize': instance.pageSize,
      'page': instance.page,
      'total': instance.total,
      'content': instance.content,
    };
