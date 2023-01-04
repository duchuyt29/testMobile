// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_party_involved.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountPartyInvolved _$AccountPartyInvolvedFromJson(
        Map<String, dynamic> json) =>
    AccountPartyInvolved(
      createDate: json['createDate'] as String?,
      modifiedDate: json['modifiedDate'] as String?,
      status: json['status'] as int?,
      createBy: json['createBy'] as String?,
      updateBy: json['updateBy'] as String?,
      id: json['id'] as int?,
      accountId: json['accountId'] as int?,
      accountName: json['accountName'] as String?,
      employeeId: json['employeeId'] as int?,
      employeeIsActive: json['employeeIsActive'] as int?,
      employeeFirstName: json['employeeFirstName'] as String?,
      employeeMiddleName: json['employeeMiddleName'] as String?,
      employeeLastName: json['employeeLastName'] as String?,
      partyInvolvedPartnerFunctionId:
          json['partyInvolvedPartnerFunctionId'] as int?,
      partyInvolvedPartnerFunctionName:
          json['partyInvolvedPartnerFunctionName'] as String?,
      employeeTitleId: json['employeeTitleId'] as int?,
      employeeTitleName: json['employeeTitleName'] as String?,
      isMain: json['isMain'] as int?,
    );

Map<String, dynamic> _$AccountPartyInvolvedToJson(
        AccountPartyInvolved instance) =>
    <String, dynamic>{
      'createDate': instance.createDate,
      'modifiedDate': instance.modifiedDate,
      'status': instance.status,
      'createBy': instance.createBy,
      'updateBy': instance.updateBy,
      'id': instance.id,
      'accountId': instance.accountId,
      'accountName': instance.accountName,
      'employeeId': instance.employeeId,
      'employeeIsActive': instance.employeeIsActive,
      'employeeFirstName': instance.employeeFirstName,
      'employeeMiddleName': instance.employeeMiddleName,
      'employeeLastName': instance.employeeLastName,
      'partyInvolvedPartnerFunctionId': instance.partyInvolvedPartnerFunctionId,
      'partyInvolvedPartnerFunctionName':
          instance.partyInvolvedPartnerFunctionName,
      'isMain': instance.isMain,
      'employeeTitleId': instance.employeeTitleId,
      'employeeTitleName': instance.employeeTitleName,
    };
