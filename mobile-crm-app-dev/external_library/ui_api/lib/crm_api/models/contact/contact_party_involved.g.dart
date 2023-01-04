// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_party_involved.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContactPartyInvolved _$ContactPartyInvolvedFromJson(
        Map<String, dynamic> json) =>
    ContactPartyInvolved(
      createDate: json['createDate'] == null
          ? null
          : DateTime.parse(json['createDate'] as String),
      modifiedDate: json['modifiedDate'] == null
          ? null
          : DateTime.parse(json['modifiedDate'] as String),
      status: json['status'] as int?,
      createBy: json['createBy'] as String?,
      updateBy: json['updateBy'] as String?,
      id: json['id'] as int?,
      contactId: json['contactId'] as int?,
      contactName: json['contactName'] as String?,
      employeeId: json['employeeId'] as int?,
      employeeIsActive: json['employeeIsActive'] as int?,
      employeeFirstName: json['employeeFirstName'] as String?,
      employeeMiddleName: json['employeeMiddleName'] as String?,
      employeeLastName: json['employeeLastName'] as String?,
      partyInvolvedPartnerFunctionId:
          json['partyInvolvedPartnerFunctionId'] as int?,
      partyInvolvedPartnerFunctionName:
          json['partyInvolvedPartnerFunctionName'] as String?,
      isMain: json['isMain'] as int?,
      employeeTitleId: json['employeeTitleId'] as int?,
      employeeTitleName: json['employeeTitleName'] as String?,
    );

Map<String, dynamic> _$ContactPartyInvolvedToJson(
        ContactPartyInvolved instance) =>
    <String, dynamic>{
      'createDate': _dateToString(instance.createDate),
      'modifiedDate': _dateToString(instance.modifiedDate),
      'status': instance.status,
      'createBy': instance.createBy,
      'updateBy': instance.updateBy,
      'id': instance.id,
      'contactId': instance.contactId,
      'contactName': instance.contactName,
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
