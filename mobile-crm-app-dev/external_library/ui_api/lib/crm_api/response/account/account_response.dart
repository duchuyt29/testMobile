import 'package:json_annotation/json_annotation.dart';

import '../../models/account/account.dart';
import '../base_response.dart';

part 'account_response.g.dart';

@JsonSerializable()
class AccountResponse extends BaseResponse {
  @JsonKey(name: 'data')
  Account? data;
  AccountResponse({this.data}) : super(false);

  factory AccountResponse.fromJson(Map<String, dynamic> json) =>
      _$AccountResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$AccountResponseToJson(this);
}
