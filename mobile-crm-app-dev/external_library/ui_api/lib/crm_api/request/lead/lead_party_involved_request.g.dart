// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lead_party_involved_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LeadPartyInvolvedRequest _$LeadPartyInvolvedRequestFromJson(
    Map<String, dynamic> json) {
  $checkKeys(
    json,
    disallowNullValues: const [
      'authorizationGroupId',
      'employeeId',
      'ownerEmployeeId',
      'objectTypeId'
    ],
  );
  return LeadPartyInvolvedRequest(
    leadId: json['leadId'] as String?,
    partyInvolvedPartnerFunctionId:
        json['partyInvolvedPartnerFunctionId'] as int?,
    authorizationGroupId: json['authorizationGroupId'] as int?,
    employeeId: json['employeeId'] as int?,
    ownerEmployeeId: json['ownerEmployeeId'] as int?,
    objectTypeId: json['objectTypeId'] as int?,
  );
}

Map<String, dynamic> _$LeadPartyInvolvedRequestToJson(
    LeadPartyInvolvedRequest instance) {
  final val = <String, dynamic>{
    'leadId': instance.leadId,
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
  writeNotNull('objectTypeId', instance.objectTypeId);
  return val;
}
