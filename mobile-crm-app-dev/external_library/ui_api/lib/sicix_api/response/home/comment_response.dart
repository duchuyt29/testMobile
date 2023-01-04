import 'package:json_annotation/json_annotation.dart';

import '../../models/home/comment.dart';
import '../base_response.dart';

part 'comment_response.g.dart';

@JsonSerializable()
class CommentResponse extends BaseResponse {
  Comment? data;

  CommentResponse({this.data}) : super(false);

  factory CommentResponse.fromJson(Map<String, dynamic> json) =>
      _$CommentResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CommentResponseToJson(this);
}
