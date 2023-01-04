import 'package:json_annotation/json_annotation.dart';

import '../../models/auth/user_info.dart';
import '../base_response.dart';

part 'profile_response.g.dart';

@JsonSerializable()
class ProfileResponse extends BaseResponse {
  UserInfo? data;

  ProfileResponse(this.data) : super(false);

  factory ProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$ProfileResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ProfileResponseToJson(this);
}
