// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workgroup_review.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkgroupReview _$WorkgroupReviewFromJson(Map<String, dynamic> json) =>
    WorkgroupReview(
      require: json['require'] as bool?,
      reviewers: (json['reviewers'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      reviewGroups: json['reviewGroups'] as List<dynamic>?,
    );

Map<String, dynamic> _$WorkgroupReviewToJson(WorkgroupReview instance) =>
    <String, dynamic>{
      'require': instance.require,
      'reviewers': instance.reviewers,
      'reviewGroups': instance.reviewGroups,
    };
