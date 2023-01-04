import 'package:json_annotation/json_annotation.dart';

import '../../models/account/account.dart';
import '../base_response.dart';

part 'accounts_response.g.dart';

@JsonSerializable()
class AccountsResponse extends BaseResponse {
  @JsonKey(name: 'data')
  Accounts? data;
  AccountsResponse({this.data}) : super(false);

  factory AccountsResponse.fromJson(Map<String, dynamic> json) =>
      _$AccountsResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$AccountsResponseToJson(this);
}
