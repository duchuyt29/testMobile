import 'package:json_annotation/json_annotation.dart';

import '../../models/auth/user_info.dart';
import '../../models/auth/user_mapping.dart';
import '../base_response.dart';

part 'user_mapping_response.g.dart';

@JsonSerializable()
class UserMappingResponse extends BaseResponse {
  UserMapping? data;

  UserMappingResponse({this.data}) : super(false);

  factory UserMappingResponse.fromJson(Map<String, dynamic> json) =>
      _$UserMappingResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$UserMappingResponseToJson(this);
}
