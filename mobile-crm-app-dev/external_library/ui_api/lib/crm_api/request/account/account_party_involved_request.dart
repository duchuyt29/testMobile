import 'package:json_annotation/json_annotation.dart';
part 'account_party_involved_request.g.dart';

@JsonSerializable()
class AccountPartyInvolvedRequest {
  String? accountId;
  int? partyInvolvedPartnerFunctionId;
  @JsonKey(disallowNullValue: true)
  int? authorizationGroupId;
  @JsonKey(disallowNullValue: true)
  int? employeeId;
  @JsonKey(disallowNullValue: true)
  int? ownerEmployeeId;

  AccountPartyInvolvedRequest({
    this.accountId,
    this.partyInvolvedPartnerFunctionId,
    this.authorizationGroupId,
    this.employeeId,
    this.ownerEmployeeId,
  });

  factory AccountPartyInvolvedRequest.fromJson(Map<String, dynamic> json) =>
      _$AccountPartyInvolvedRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AccountPartyInvolvedRequestToJson(this);
}
