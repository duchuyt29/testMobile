// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lead_party_involved.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LeadPartyInvolved _$LeadPartyInvolvedFromJson(Map<String, dynamic> json) =>
    LeadPartyInvolved(
      createDate: json['createDate'] as String?,
      modifiedDate: json['modifiedDate'] as String?,
      status: json['status'] as int?,
      createBy: json['createBy'] as String?,
      updateBy: json['updateBy'] as String?,
      id: json['id'] as int?,
      leadId: json['leadId'] as int?,
      opportunityId: json['opportunityId'] as int?,
      quoteId: json['quoteId'] as int?,
      contractId: json['contractId'] as int?,
      orderId: json['orderId'] as int?,
      objectTypeId: json['objectTypeId'] as int?,
      employeeId: json['employeeId'] as int?,
      partyInvolvedPartnerFunctionId:
          json['partyInvolvedPartnerFunctionId'] as int?,
      isMain: json['isMain'] as int?,
      authorizationGroupId: json['authorizationGroupId'] as int?,
    );

Map<String, dynamic> _$LeadPartyInvolvedToJson(LeadPartyInvolved instance) =>
    <String, dynamic>{
      'createDate': instance.createDate,
      'modifiedDate': instance.modifiedDate,
      'status': instance.status,
      'createBy': instance.createBy,
      'updateBy': instance.updateBy,
      'id': instance.id,
      'leadId': instance.leadId,
      'opportunityId': instance.opportunityId,
      'quoteId': instance.quoteId,
      'contractId': instance.contractId,
      'orderId': instance.orderId,
      'objectTypeId': instance.objectTypeId,
      'employeeId': instance.employeeId,
      'partyInvolvedPartnerFunctionId': instance.partyInvolvedPartnerFunctionId,
      'isMain': instance.isMain,
      'authorizationGroupId': instance.authorizationGroupId,
    };
