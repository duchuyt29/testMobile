import 'package:json_annotation/json_annotation.dart';

part 'workgroup_review.g.dart';

@JsonSerializable()
class WorkgroupReview {
  bool? require;
  List<String>? reviewers;
  List<dynamic>? reviewGroups;

  WorkgroupReview({this.require, this.reviewers, this.reviewGroups});

  factory WorkgroupReview.fromJson(Map<String, dynamic> json) {
    return _$WorkgroupReviewFromJson(json);
  }

  Map<String, dynamic> toJson() => _$WorkgroupReviewToJson(this);
}
