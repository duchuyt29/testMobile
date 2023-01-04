import 'package:json_annotation/json_annotation.dart';

part 'token_model.g.dart';

@JsonSerializable()
class TokenModel {
  @JsonKey(name: 'access_token')
  String? accessToken;
  @JsonKey(name: 'expires_in')
  int? expiresIn;
  @JsonKey(name: 'refresh_expires_in')
  int? refreshExpiresIn;
  @JsonKey(name: 'refresh_token')
  String? refreshToken;

  TokenModel(
      {this.accessToken,
      this.expiresIn,
      this.refreshExpiresIn,
      this.refreshToken});

  factory TokenModel.fromJson(Map<String, dynamic> json) =>
      _$TokenModelFromJson(json);

  Map<String, dynamic> toJson() => _$TokenModelToJson(this);
}
