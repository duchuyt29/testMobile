import 'package:json_annotation/json_annotation.dart';

import '../base_models.dart';
import '../common/reaction_model.dart';
import '../media_file/media_file.dart';
import 'user.dart';

part 'comment.g.dart';

@JsonSerializable()
class Comment {
  String? id;
  int? companyId;
  User? createBy;
  DateTime? createDate;
  DateTime? modifiedDate;
  String? type;
  String? parentId;
  int? childrenQuantity;
  String? content;

  @JsonKey(defaultValue: [])
  List<MediaFile>? attachments;

  @JsonKey(defaultValue: [])
  List<Comment>? subComments;

  ReactionModel? reaction;

  Comment({
    this.id,
    this.companyId,
    this.createBy,
    this.createDate,
    this.modifiedDate,
    this.type,
    this.parentId,
    this.content,
    this.attachments,
    this.subComments,
    this.reaction,
  });

  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);

  Map<String, dynamic> toJson() => _$CommentToJson(this);
}

@JsonSerializable()
class Comments extends BaseModels {
  @JsonKey(defaultValue: [])
  List<Comment> content;

  Comments(this.content);

  factory Comments.fromJson(Map<String, dynamic> json) =>
      _$CommentsFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CommentsToJson(this);
}
