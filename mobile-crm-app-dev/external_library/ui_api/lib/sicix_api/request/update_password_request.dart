import 'package:json_annotation/json_annotation.dart';

part 'update_password_request.g.dart';

@JsonSerializable()
class UpdatePasswordRequest {
  String? id;
  String? oldPassword;
  String? password;

  UpdatePasswordRequest({this.id, this.oldPassword, this.password});

  factory UpdatePasswordRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdatePasswordRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UpdatePasswordRequestToJson(this);
}
