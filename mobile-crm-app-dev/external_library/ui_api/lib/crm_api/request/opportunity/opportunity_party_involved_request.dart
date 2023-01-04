import 'package:json_annotation/json_annotation.dart';
part 'opportunity_party_involved_request.g.dart';

@JsonSerializable()
class OpportunityPartyInvolvedRequest {
  String? opportunityId;
  int? partyInvolvedPartnerFunctionId;
  @JsonKey(disallowNullValue: true)
  int? authorizationGroupId;
  @JsonKey(disallowNullValue: true)
  int? employeeId;
  @JsonKey(disallowNullValue: true)
  int? ownerEmployeeId;
  int? objectTypeId = 4;

  OpportunityPartyInvolvedRequest({
    this.opportunityId,
    this.partyInvolvedPartnerFunctionId,
    this.authorizationGroupId,
    this.employeeId,
    this.ownerEmployeeId,
    this.objectTypeId,
  });

  factory OpportunityPartyInvolvedRequest.fromJson(Map<String, dynamic> json) =>
      _$OpportunityPartyInvolvedRequestFromJson(json);

  Map<String, dynamic> toJson() =>
      _$OpportunityPartyInvolvedRequestToJson(this);
}
