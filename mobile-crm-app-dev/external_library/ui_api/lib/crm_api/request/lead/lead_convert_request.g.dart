// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lead_convert_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LeadConvertRequest _$LeadConvertRequestFromJson(Map<String, dynamic> json) =>
    LeadConvertRequest(
      accountId: json['accountId'] as int?,
      accountName: json['accountName'] as String?,
      accountTypeId: json['accountTypeId'] as int?,
      accountPhone: json['accountPhone'] as String?,
      documentTypeId: json['documentTypeId'] as int?,
      documentNumber: json['documentNumber'] as String?,
      contactId: json['contactId'] as int?,
      contactName: json['contactName'] as String?,
      contactPhone: json['contactPhone'] as String?,
      contactTitle: json['contactTitle'] as String?,
      accountRelationTypeId: json['accountRelationTypeId'] as int?,
      leadId: json['leadId'] as int?,
      opportunityName: json['opportunityName'] as String?,
      stageId: json['stageId'] as int?,
      currencyExchangeRateId: json['currencyExchangeRateId'] as int?,
      closeDate: json['closeDate'] == null
          ? null
          : DateTime.parse(json['closeDate'] as String),
      leadStageId: json['leadStageId'] as int?,
      employeeId: json['employeeId'] as int?,
      startDate: json['startDate'] == null
          ? null
          : DateTime.parse(json['startDate'] as String),
    );

Map<String, dynamic> _$LeadConvertRequestToJson(LeadConvertRequest instance) =>
    <String, dynamic>{
      'accountId': instance.accountId,
      'accountName': instance.accountName,
      'accountTypeId': instance.accountTypeId,
      'accountPhone': instance.accountPhone,
      'documentTypeId': instance.documentTypeId,
      'documentNumber': instance.documentNumber,
      'contactId': instance.contactId,
      'contactName': instance.contactName,
      'contactPhone': instance.contactPhone,
      'contactTitle': instance.contactTitle,
      'accountRelationTypeId': instance.accountRelationTypeId,
      'leadId': instance.leadId,
      'opportunityName': instance.opportunityName,
      'stageId': instance.stageId,
      'currencyExchangeRateId': instance.currencyExchangeRateId,
      'closeDate': _dateToString(instance.closeDate),
      'leadStageId': instance.leadStageId,
      'employeeId': instance.employeeId,
      'startDate': _dateToString(instance.startDate),
    };
