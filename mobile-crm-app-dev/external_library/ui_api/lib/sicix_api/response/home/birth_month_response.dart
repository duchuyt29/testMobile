import 'package:json_annotation/json_annotation.dart';

import '../../models/auth/user_info.dart';
import '../base_response.dart';

part 'birth_month_response.g.dart';

@JsonSerializable()
class BirthMonthResponse extends BaseResponse {
  @JsonKey(defaultValue: [])
  List<UserInfo> data;

  BirthMonthResponse(this.data) : super(false);

  factory BirthMonthResponse.fromJson(Map<String, dynamic> json) =>
      _$BirthMonthResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$BirthMonthResponseToJson(this);
}
