import 'package:json_annotation/json_annotation.dart';

import '../../models/auth/user_info.dart';
import '../base_response.dart';

part 'user_infos_response.g.dart';

@JsonSerializable()
class UserInfosResponse extends BaseResponse {
  UserInfos? data;

  UserInfosResponse({this.data}) : super(false);

  factory UserInfosResponse.fromJson(Map<String, dynamic> json) =>
      _$UserInfosResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$UserInfosResponseToJson(this);
}
