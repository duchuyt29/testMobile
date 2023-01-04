// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_content.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostContent _$PostContentFromJson(Map<String, dynamic> json) => PostContent(
      task: json['task'] == null
          ? null
          : Task.fromJson(json['task'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PostContentToJson(PostContent instance) =>
    <String, dynamic>{
      'task': instance.task,
    };
