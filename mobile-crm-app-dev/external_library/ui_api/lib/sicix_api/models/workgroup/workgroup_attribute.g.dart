// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workgroup_attribute.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkgroupAttribute _$WorkgroupAttributeFromJson(Map<String, dynamic> json) =>
    WorkgroupAttribute(
      review: json['review'] == null
          ? null
          : WorkgroupReview.fromJson(json['review'] as Map<String, dynamic>),
      reviewers: json['reviewers'] as List<dynamic>?,
      reviewGroups: json['reviewGroups'] as List<dynamic>?,
      delegate: json['delegate'] as String?,
      comment: json['comment'] == null
          ? null
          : WorkgroupComment.fromJson(json['comment'] as Map<String, dynamic>),
      avatar: json['avatar'] as String?,
    );

Map<String, dynamic> _$WorkgroupAttributeToJson(WorkgroupAttribute instance) =>
    <String, dynamic>{
      'review': instance.review,
      'reviewers': instance.reviewers,
      'reviewGroups': instance.reviewGroups,
      'delegate': instance.delegate,
      'comment': instance.comment,
      'avatar': instance.avatar,
    };
