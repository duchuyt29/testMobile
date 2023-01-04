// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'opportunity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Opportunity _$OpportunityFromJson(Map<String, dynamic> json) => Opportunity(
      amount: (json['amount'] as num?)?.toDouble(),
      id: json['id'] as int?,
      currencyExchangeRateId: json['currencyExchangeRateId'] as int?,
      closeDate: json['closeDate'] == null
          ? null
          : DateTime.parse(json['closeDate'] as String),
      opportunityName: json['opportunityName'] as String?,
      opportunityCode: json['opportunityCode'] as String?,
      opportunityStageId: json['opportunityStageId'] as int?,
    );

Map<String, dynamic> _$OpportunityToJson(Opportunity instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'id': instance.id,
      'currencyExchangeRateId': instance.currencyExchangeRateId,
      'closeDate': instance.closeDate?.toIso8601String(),
      'opportunityName': instance.opportunityName,
      'opportunityCode': instance.opportunityCode,
      'opportunityStageId': instance.opportunityStageId,
    };

Opportunities _$OpportunitiesFromJson(Map<String, dynamic> json) =>
    Opportunities(
      (json['content'] as List<dynamic>?)
              ?.map((e) => Opportunity.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    )
      ..pageSize = json['pageSize'] as int?
      ..page = json['page'] as int?
      ..total = json['total'] as int?;

Map<String, dynamic> _$OpportunitiesToJson(Opportunities instance) =>
    <String, dynamic>{
      'pageSize': instance.pageSize,
      'page': instance.page,
      'total': instance.total,
      'content': instance.content,
    };
