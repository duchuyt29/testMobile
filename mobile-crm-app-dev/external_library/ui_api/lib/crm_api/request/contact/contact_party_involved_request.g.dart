// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_party_involved_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContactPartyInvolvedRequest _$ContactPartyInvolvedRequestFromJson(
    Map<String, dynamic> json) {
  $checkKeys(
    json,
    disallowNullValues: const [
      'authorizationGroupId',
      'employeeId',
      'ownerEmployeeId'
    ],
  );
  return ContactPartyInvolvedRequest(
    contactId: json['contactId'] as String?,
    partyInvolvedPartnerFunctionId:
        json['partyInvolvedPartnerFunctionId'] as int?,
    authorizationGroupId: json['authorizationGroupId'] as int?,
    employeeId: json['employeeId'] as int?,
    ownerEmployeeId: json['ownerEmployeeId'] as int?,
  );
}

Map<String, dynamic> _$ContactPartyInvolvedRequestToJson(
    ContactPartyInvolvedRequest instance) {
  final val = <String, dynamic>{
    'contactId': instance.contactId,
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
  return val;
}
