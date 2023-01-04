import 'package:json_annotation/json_annotation.dart';
part 'contact_party_involved_request.g.dart';

@JsonSerializable()
class ContactPartyInvolvedRequest {
  String? contactId;
  int? partyInvolvedPartnerFunctionId;
  @JsonKey(disallowNullValue: true)
  int? authorizationGroupId;
  @JsonKey(disallowNullValue: true)
  int? employeeId;
  @JsonKey(disallowNullValue: true)
  int? ownerEmployeeId;

  ContactPartyInvolvedRequest({
    this.contactId,
    this.partyInvolvedPartnerFunctionId,
    this.authorizationGroupId,
    this.employeeId,
    this.ownerEmployeeId,
  });

  factory ContactPartyInvolvedRequest.fromJson(Map<String, dynamic> json) =>
      _$ContactPartyInvolvedRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ContactPartyInvolvedRequestToJson(this);
}
