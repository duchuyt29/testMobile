import 'package:json_annotation/json_annotation.dart';

import '../../models/home/comment.dart';
import '../base_response.dart';

part 'comments_response.g.dart';

@JsonSerializable()
class CommentsResponse extends BaseResponse {
  Comments? data;

  CommentsResponse({this.data}) : super(false);

  factory CommentsResponse.fromJson(Map<String, dynamic> json) =>
      _$CommentsResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CommentsResponseToJson(this);
}
