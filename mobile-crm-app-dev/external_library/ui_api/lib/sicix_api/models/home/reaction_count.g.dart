// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reaction_count.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReactionCount _$ReactionCountFromJson(Map<String, dynamic> json) =>
    ReactionCount(
      code: json['code'] as String?,
      success: json['success'] as bool?,
      title: json['title'] as String?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => UserReaction.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ReactionCountToJson(ReactionCount instance) =>
    <String, dynamic>{
      'code': instance.code,
      'success': instance.success,
      'title': instance.title,
      'message': instance.message,
      'data': instance.data,
    };
