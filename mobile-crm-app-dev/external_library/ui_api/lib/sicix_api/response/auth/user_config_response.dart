import 'package:json_annotation/json_annotation.dart';

import '../../models/auth/user_config/user_config.dart';
import '../base_response.dart';

part 'user_config_response.g.dart';

@JsonSerializable()
class UserConfigResponse extends BaseResponse {
  UserConfig? data;

  UserConfigResponse({this.data}) : super(false);

  factory UserConfigResponse.fromJson(Map<String, dynamic> json) =>
      _$UserConfigResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$UserConfigResponseToJson(this);
}
