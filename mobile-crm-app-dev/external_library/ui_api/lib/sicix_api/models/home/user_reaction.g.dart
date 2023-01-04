// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_reaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserReaction _$UserReactionFromJson(Map<String, dynamic> json) => UserReaction(
      createDate: json['createDate'] as String?,
      user: json['userId'] == null
          ? null
          : User.fromJson(json['userId'] as Map<String, dynamic>),
      type: json['type'] as String?,
    );

Map<String, dynamic> _$UserReactionToJson(UserReaction instance) =>
    <String, dynamic>{
      'createDate': instance.createDate,
      'userId': instance.user,
      'type': instance.type,
    };

UserViewerData _$UserViewerDataFromJson(Map<String, dynamic> json) =>
    UserViewerData(
      (json['content'] as List<dynamic>?)
              ?.map((e) => UserReaction.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    )
      ..pageSize = json['pageSize'] as int?
      ..page = json['page'] as int?
      ..total = json['total'] as int?;

Map<String, dynamic> _$UserViewerDataToJson(UserViewerData instance) =>
    <String, dynamic>{
      'pageSize': instance.pageSize,
      'page': instance.page,
      'total': instance.total,
      'content': instance.content,
    };
