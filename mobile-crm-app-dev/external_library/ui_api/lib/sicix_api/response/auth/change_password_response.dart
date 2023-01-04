import 'package:json_annotation/json_annotation.dart';
import '../base_response.dart';

part 'change_password_response.g.dart';

@JsonSerializable()
class ChangePasswordResponse extends BaseResponse {
  bool data;
  ChangePasswordResponse(this.data) : super(false);

  factory ChangePasswordResponse.fromJson(Map<String, dynamic> json) =>
      _$ChangePasswordResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ChangePasswordResponseToJson(this);
}
