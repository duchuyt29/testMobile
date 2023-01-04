// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'opportunity_info_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OpportunityInfoRequest _$OpportunityInfoRequestFromJson(
        Map<String, dynamic> json) =>
    OpportunityInfoRequest(
      id: json['id'] as int?,
      opportunityName: json['opportunityName'] as String?,
      accountId: json['accountId'] as int?,
      typeId: json['typeId'] as int?,
      leadSourceId: json['leadSourceId'] as int?,
      probability: (json['probability'] as num?)?.toDouble(),
      currencyExchangeRateId: json['currencyExchangeRateId'] as int?,
    );

Map<String, dynamic> _$OpportunityInfoRequestToJson(
        OpportunityInfoRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'opportunityName': instance.opportunityName,
      'accountId': instance.accountId,
      'typeId': instance.typeId,
      'leadSourceId': instance.leadSourceId,
      'probability': instance.probability,
      'currencyExchangeRateId': instance.currencyExchangeRateId,
    };
