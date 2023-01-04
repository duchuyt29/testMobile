import 'package:json_annotation/json_annotation.dart';

import '../../models/account/account_count.dart';
import '../base_response.dart';

part 'account_count_response.g.dart';

@JsonSerializable()
class AccountCountResponse extends BaseResponse {
  @JsonKey(name: 'data')
  AccountCount? data;
  AccountCountResponse({this.data}) : super(false);

  factory AccountCountResponse.fromJson(Map<String, dynamic> json) =>
      _$AccountCountResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$AccountCountResponseToJson(this);
}
