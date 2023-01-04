import 'package:json_annotation/json_annotation.dart';

import '../../models/base_models.dart';
import '../../models/home/post_content.dart';
import '../base_response.dart';

part 'home_post_response.g.dart';

@JsonSerializable()
class HomePostResponse extends BaseResponse {
  HomePostData? data;

  HomePostResponse({this.data}) : super(false);

  factory HomePostResponse.fromJson(Map<String, dynamic> json) =>
      _$HomePostResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$HomePostResponseToJson(this);
}

@JsonSerializable()
class HomePostData extends BaseModels {
  @JsonKey(defaultValue: [])
  List<PostContent> content;

  HomePostData(this.content);

  factory HomePostData.fromJson(Map<String, dynamic> json) =>
      _$HomePostDataFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$HomePostDataToJson(this);
}
