// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'opportunity_party_involved_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OpportunityPartyInvolvedRequest _$OpportunityPartyInvolvedRequestFromJson(
    Map<String, dynamic> json) {
  $checkKeys(
    json,
    disallowNullValues: const [
      'authorizationGroupId',
      'employeeId',
      'ownerEmployeeId'
    ],
  );
  return OpportunityPartyInvolvedRequest(
    opportunityId: json['opportunityId'] as String?,
    partyInvolvedPartnerFunctionId:
        json['partyInvolvedPartnerFunctionId'] as int?,
    authorizationGroupId: json['authorizationGroupId'] as int?,
    employeeId: json['employeeId'] as int?,
    ownerEmployeeId: json['ownerEmployeeId'] as int?,
    objectTypeId: json['objectTypeId'] as int?,
  );
}

Map<String, dynamic> _$OpportunityPartyInvolvedRequestToJson(
    OpportunityPartyInvolvedRequest instance) {
  final val = <String, dynamic>{
    'opportunityId': instance.opportunityId,
    'partyInvolvedPartnerFunctionId': instance.partyInvolvedPartnerFunctionId,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('authorizationGroupId', instance.authorizationGroupId);
  writeNotNull('employeeId', instance.employeeId);
  writeNotNull('ownerEmployeeId', instance.ownerEmployeeId);
  val['objectTypeId'] = instance.objectTypeId;
  return val;
}
