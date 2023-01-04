import 'package:json_annotation/json_annotation.dart';

part 'user_by_id_request.g.dart';

@JsonSerializable()
class UserByIdRequest {
  List<String>? users;

  UserByIdRequest({this.users});

  factory UserByIdRequest.fromJson(Map<String, dynamic> json) {
    return _$UserByIdRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UserByIdRequestToJson(this);
}
