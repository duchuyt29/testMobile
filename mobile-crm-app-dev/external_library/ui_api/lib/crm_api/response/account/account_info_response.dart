import 'package:json_annotation/json_annotation.dart';

import '../../models/account/account.dart';
import '../base_response.dart';

part 'account_info_response.g.dart';

@JsonSerializable()
class AccountInfoResponse extends BaseResponse {
  @JsonKey(name: 'data')
  AccountInfo? data;
  AccountInfoResponse({this.data}) : super(false);

  factory AccountInfoResponse.fromJson(Map<String, dynamic> json) =>
      _$AccountInfoResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$AccountInfoResponseToJson(this);
}
