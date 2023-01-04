// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'opportunity_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OpportunityRequest _$OpportunityRequestFromJson(Map<String, dynamic> json) =>
    OpportunityRequest(
      employeeId: json['employeeId'] as int?,
      opportunityCode: json['opportunityCode'] as String?,
      opportunityName: json['opportunityName'] as String?,
      accountId: json['accountId'] as int?,
      stageId: json['stageId'] as int?,
      typeId: json['typeId'] as int?,
      stageReasonId: json['stageReasonId'] as int?,
      probability: (json['probability'] as num?)?.toDouble(),
      currencyExchangeRateId: json['currencyExchangeRateId'] as int?,
      description: json['description'] as String?,
      closeDate: json['closeDate'] as String?,
      opportunityUUID: json['opportunityUUID'] as String?,
      leadSourceId: json['leadSourceId'] as int?,
      amount: (json['amount'] as num?)?.toDouble(),
      startDate: json['startDate'] as String?,
    );

Map<String, dynamic> _$OpportunityRequestToJson(OpportunityRequest instance) =>
    <String, dynamic>{
      'employeeId': instance.employeeId,
      'opportunityCode': instance.opportunityCode,
      'opportunityName': instance.opportunityName,
      'accountId': instance.accountId,
      'stageId': instance.stageId,
      'typeId': instance.typeId,
      'stageReasonId': instance.stageReasonId,
      'probability': instance.probability,
      'currencyExchangeRateId': instance.currencyExchangeRateId,
      'description': instance.description,
      'closeDate': instance.closeDate,
      'opportunityUUID': instance.opportunityUUID,
      'leadSourceId': instance.leadSourceId,
      'startDate': instance.startDate,
      'amount': instance.amount,
    };
