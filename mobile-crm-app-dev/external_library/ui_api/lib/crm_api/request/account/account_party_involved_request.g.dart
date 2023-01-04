// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_party_involved_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountPartyInvolvedRequest _$AccountPartyInvolvedRequestFromJson(
    Map<String, dynamic> json) {
  $checkKeys(
    json,
    disallowNullValues: const [
      'authorizationGroupId',
      'employeeId',
      'ownerEmployeeId'
    ],
  );
  return AccountPartyInvolvedRequest(
    accountId: json['accountId'] as String?,
    partyInvolvedPartnerFunctionId:
        json['partyInvolvedPartnerFunctionId'] as int?,
    authorizationGroupId: json['authorizationGroupId'] as int?,
    employeeId: json['employeeId'] as int?,
    ownerEmployeeId: json['ownerEmployeeId'] as int?,
  );
}

Map<String, dynamic> _$AccountPartyInvolvedRequestToJson(
    AccountPartyInvolvedRequest instance) {
  final val = <String, dynamic>{
    'accountId': instance.accountId,
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
