// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'opp_sale_party_involved.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OppSalePartyInvolved _$OppSalePartyInvolvedFromJson(
        Map<String, dynamic> json) =>
    OppSalePartyInvolved(
      createDate: json['createDate'] as String?,
      modifiedDate: json['modifiedDate'] as String?,
      status: json['status'] as int?,
      createBy: json['createBy'] as String?,
      updateBy: json['updateBy'] as String?,
      id: json['id'] as int?,
      opportunityId: json['opportunityId'] as int?,
      objectTypeId: json['objectTypeId'] as int?,
      employeeId: json['employeeId'] as int?,
      isMain: json['isMain'] as int?,
      employeeFirstName: json['employeeFirstName'] as String?,
      employeeLastName: json['employeeLastName'] as String?,
      employeeMiddleName: json['employeeMiddleName'] as String?,
      employeeTitleName: json['employeeTitleName'] as String?,
      employeeTitleId: json['employeeTitleId'] as int?,
      partyInvolvedPartnerFunctionId:
          json['partyInvolvedPartnerFunctionId'] as int?,
    );

Map<String, dynamic> _$OppSalePartyInvolvedToJson(
        OppSalePartyInvolved instance) =>
    <String, dynamic>{
      'createDate': instance.createDate,
      'modifiedDate': instance.modifiedDate,
      'status': instance.status,
      'createBy': instance.createBy,
      'updateBy': instance.updateBy,
      'id': instance.id,
      'opportunityId': instance.opportunityId,
      'objectTypeId': instance.objectTypeId,
      'employeeId': instance.employeeId,
      'isMain': instance.isMain,
      'employeeFirstName': instance.employeeFirstName,
      'employeeLastName': instance.employeeLastName,
      'employeeMiddleName': instance.employeeMiddleName,
      'employeeTitleName': instance.employeeTitleName,
      'employeeTitleId': instance.employeeTitleId,
      'partyInvolvedPartnerFunctionId': instance.partyInvolvedPartnerFunctionId,
    };
