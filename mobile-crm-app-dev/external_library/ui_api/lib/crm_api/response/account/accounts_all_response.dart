import 'package:json_annotation/json_annotation.dart';

import '../../models/account/account.dart';
import '../base_response.dart';

part 'accounts_all_response.g.dart';

@JsonSerializable()
class AccountAllResponse extends BaseResponse {
  @JsonKey(name: 'data')
  List<AccountInfo>? data;
  AccountAllResponse({this.data}) : super(false);

  factory AccountAllResponse.fromJson(Map<String, dynamic> json) =>
      _$AccountAllResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$AccountAllResponseToJson(this);
}
