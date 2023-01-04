import 'package:json_annotation/json_annotation.dart';

import '../../models/auth/token_model.dart';
import '../base_response.dart';

part 'token_response.g.dart';

@JsonSerializable()
class TokenResponse extends BaseResponse {
  TokenModel? data;

  TokenResponse({this.data}) : super(false);

  factory TokenResponse.fromJson(Map<String, dynamic> json) =>
      _$TokenResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TokenResponseToJson(this);
}
