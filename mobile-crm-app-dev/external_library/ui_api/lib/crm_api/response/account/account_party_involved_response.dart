import 'package:json_annotation/json_annotation.dart';

import '../../models/account/account_party_involved.dart';
import '../base_response.dart';

part 'account_party_involved_response.g.dart';

@JsonSerializable()
class AccountPartyInvolvedResponse extends BaseResponse {
  @JsonKey(name: 'data')
  List<AccountPartyInvolved>? data;
  AccountPartyInvolvedResponse({this.data}) : super(false);

  factory AccountPartyInvolvedResponse.fromJson(Map<String, dynamic> json) =>
      _$AccountPartyInvolvedResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$AccountPartyInvolvedResponseToJson(this);
}
