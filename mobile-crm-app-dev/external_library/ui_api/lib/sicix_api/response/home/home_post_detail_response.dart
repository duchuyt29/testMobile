import 'package:json_annotation/json_annotation.dart';

import '../../models/home/post_content.dart';
import '../base_response.dart';

part 'home_post_detail_response.g.dart';

@JsonSerializable()
class HomePostDetailResponse extends BaseResponse {
  PostContent? data;

  HomePostDetailResponse({this.data}) : super(false);

  factory HomePostDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$HomePostDetailResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$HomePostDetailResponseToJson(this);
}
