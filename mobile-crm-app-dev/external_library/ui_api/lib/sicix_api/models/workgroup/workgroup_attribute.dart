import 'package:json_annotation/json_annotation.dart';
import 'package:sicix/shared/services/path_service.dart';

import 'workgroup_comment.dart';
import 'workgroup_review.dart';

part 'workgroup_attribute.g.dart';

@JsonSerializable()
class WorkgroupAttribute {
  WorkgroupReview? review;
  List<dynamic>? reviewers;
  List<dynamic>? reviewGroups;
  String? delegate;
  WorkgroupComment? comment;
  String? avatar;

  WorkgroupAttribute({
    this.review,
    this.reviewers,
    this.reviewGroups,
    this.delegate,
    this.comment,
    this.avatar,
  });

  factory WorkgroupAttribute.fromJson(Map<String, dynamic> json) =>
      _$WorkgroupAttributeFromJson(json);

  Map<String, dynamic> toJson() => _$WorkgroupAttributeToJson(this);

  String getAvatar() {
    return PathService.imagePath(avatar ?? '');
  }
}
