import 'package:json_annotation/json_annotation.dart';

part 'workgroup_comment.g.dart';

@JsonSerializable()
class WorkgroupComment {
  bool? editable;
  bool? deletable;

  WorkgroupComment({this.editable, this.deletable});

  factory WorkgroupComment.fromJson(Map<String, dynamic> json) {
    return _$WorkgroupCommentFromJson(json);
  }

  Map<String, dynamic> toJson() => _$WorkgroupCommentToJson(this);
}
