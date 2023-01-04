import 'package:json_annotation/json_annotation.dart';

import '../../models/auth/user_info.dart';
import '../base_response.dart';

part 'avatar_response.g.dart';

@JsonSerializable()
class AvatarResponse extends BaseResponse {
  @JsonKey(name: 'data')
  UserInfo? avatarModel;

  AvatarResponse({this.avatarModel}) : super(false);

  factory AvatarResponse.fromJson(Map<String, dynamic> json) =>
      _$AvatarResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$AvatarResponseToJson(this);
}
