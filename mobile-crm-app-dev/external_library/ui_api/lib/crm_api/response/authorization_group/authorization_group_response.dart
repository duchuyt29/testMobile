import 'package:json_annotation/json_annotation.dart';

import '../../models/authorization_group/authorization_group.dart';
import '../base_response.dart';

part 'authorization_group_response.g.dart';

@JsonSerializable()
class AuthorizationGroupResponse extends BaseResponse {
  @JsonKey(name: 'data')
  List<AuthorizationGroup>? data;

  AuthorizationGroupResponse({this.data}) : super(false);

  factory AuthorizationGroupResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthorizationGroupResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$AuthorizationGroupResponseToJson(this);
}
