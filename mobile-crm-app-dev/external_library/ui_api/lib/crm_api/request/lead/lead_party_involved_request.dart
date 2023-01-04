import 'package:json_annotation/json_annotation.dart';
part 'lead_party_involved_request.g.dart';

@JsonSerializable()
class LeadPartyInvolvedRequest {
  String? leadId;
  int? partyInvolvedPartnerFunctionId;
  @JsonKey(disallowNullValue: true)
  int? authorizationGroupId;
  @JsonKey(disallowNullValue: true)
  int? employeeId;
  @JsonKey(disallowNullValue: true)
  int? ownerEmployeeId;
  @JsonKey(disallowNullValue: true)
  int? objectTypeId;

  LeadPartyInvolvedRequest({
    this.leadId,
    this.partyInvolvedPartnerFunctionId,
    this.authorizationGroupId,
    this.employeeId,
    this.ownerEmployeeId,
    this.objectTypeId,
  });

  factory LeadPartyInvolvedRequest.fromJson(Map<String, dynamic> json) =>
      _$LeadPartyInvolvedRequestFromJson(json);

  Map<String, dynamic> toJson() => _$LeadPartyInvolvedRequestToJson(this);
}
