import 'package:json_annotation/json_annotation.dart';

import '../../models/home/user_reaction.dart';
import '../base_response.dart';

part 'post_viewer_response.g.dart';

@JsonSerializable()
class PostViewerResponse extends BaseResponse {
  UserViewerData? data;

  PostViewerResponse({this.data}) : super(false);

  factory PostViewerResponse.fromJson(Map<String, dynamic> json) =>
      _$PostViewerResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PostViewerResponseToJson(this);
}
