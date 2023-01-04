// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crm_master_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CrmMasterData _$CrmMasterDataFromJson(Map<String, dynamic> json) =>
    CrmMasterData(
      listAccountType: (json['listAccountType'] as List<dynamic>?)
          ?.map((e) => AccountType.fromJson(e as Map<String, dynamic>))
          .toList(),
      listGender: (json['listGender'] as List<dynamic>?)
          ?.map((e) => Gender.fromJson(e as Map<String, dynamic>))
          .toList(),
      listIndustry: (json['listIndustry'] as List<dynamic>?)
          ?.map((e) => Industry.fromJson(e as Map<String, dynamic>))
          .toList(),
      listAccountAddressType: (json['listAccountAddressType'] as List<dynamic>?)
          ?.map((e) => AccountAddressType.fromJson(e as Map<String, dynamic>))
          .toList(),
      listCountry: (json['listCountry'] as List<dynamic>?)
          ?.map((e) => Country.fromJson(e as Map<String, dynamic>))
          .toList(),
      listSalutation: (json['listSalutation'] as List<dynamic>?)
          ?.map((e) => Salutation.fromJson(e as Map<String, dynamic>))
          .toList(),
      listAccountRelationType: (json['listAccountRelationType']
              as List<dynamic>?)
          ?.map((e) => AccountRelationType.fromJson(e as Map<String, dynamic>))
          .toList(),
      listLeadPotentialLevel: (json['listLeadPotentialLevel'] as List<dynamic>?)
          ?.map((e) => LeadPotentialLevel.fromJson(e as Map<String, dynamic>))
          .toList(),
      listLeadStage: (json['listLeadStage'] as List<dynamic>?)
          ?.map((e) => LeadStage.fromJson(e as Map<String, dynamic>))
          .toList(),
      listOpportunityStage: (json['listOpportunityStage'] as List<dynamic>?)
          ?.map((e) => OpportunityStage.fromJson(e as Map<String, dynamic>))
          .toList(),
      listCurrencyExchangeRate: (json['listCurrencyExchangeRate']
              as List<dynamic>?)
          ?.map((e) => CurrencyExchangeRate.fromJson(e as Map<String, dynamic>))
          .toList(),
      listPriority: (json['listPriority'] as List<dynamic>?)
          ?.map((e) => Priority.fromJson(e as Map<String, dynamic>))
          .toList(),
      listDurationUnit: (json['listDurationUnit'] as List<dynamic>?)
          ?.map((e) => DurationUnit.fromJson(e as Map<String, dynamic>))
          .toList(),
      listPartyInvolvedPartnerFunction:
          (json['listPartyInvolvedPartnerFunction'] as List<dynamic>?)
              ?.map((e) => PartyInvolvedPartnerFunction.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      listDocumentType: (json['listDocumentType'] as List<dynamic>?)
          ?.map((e) => DocumentType.fromJson(e as Map<String, dynamic>))
          .toList(),
      taskType: (json['taskType'] as List<dynamic>?)
          ?.map((e) => TaskType.fromJson(e as Map<String, dynamic>))
          .toList(),
      leadSources: (json['leadSource'] as List<dynamic>?)
          ?.map((e) => LeadSource.fromJson(e as Map<String, dynamic>))
          .toList(),
      opportunityType: (json['opportunityType'] as List<dynamic>?)
          ?.map((e) => OpportunityType.fromJson(e as Map<String, dynamic>))
          .toList(),
      listPrice: (json['listPrice'] as List<dynamic>?)
          ?.map((e) => Price.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CrmMasterDataToJson(CrmMasterData instance) =>
    <String, dynamic>{
      'listAccountType': instance.listAccountType,
      'listGender': instance.listGender,
      'listIndustry': instance.listIndustry,
      'listAccountAddressType': instance.listAccountAddressType,
      'listCountry': instance.listCountry,
      'listSalutation': instance.listSalutation,
      'listAccountRelationType': instance.listAccountRelationType,
      'listLeadPotentialLevel': instance.listLeadPotentialLevel,
      'listLeadStage': instance.listLeadStage,
      'listOpportunityStage': instance.listOpportunityStage,
      'listCurrencyExchangeRate': instance.listCurrencyExchangeRate,
      'listPriority': instance.listPriority,
      'listDurationUnit': instance.listDurationUnit,
      'listPartyInvolvedPartnerFunction':
          instance.listPartyInvolvedPartnerFunction,
      'listDocumentType': instance.listDocumentType,
      'taskType': instance.taskType,
      'leadSource': instance.leadSources,
      'opportunityType': instance.opportunityType,
      'listPrice': instance.listPrice,
    };
