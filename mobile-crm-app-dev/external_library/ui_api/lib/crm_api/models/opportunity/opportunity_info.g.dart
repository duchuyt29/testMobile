// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'opportunity_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OpportunityInfo _$OpportunityInfoFromJson(Map<String, dynamic> json) =>
    OpportunityInfo(
      employeeId: json['employeeId'] as int?,
      employeeFirstName: json['employeeFirstName'] as String?,
      employeeLastName: json['employeeLastName'] as String?,
      employeeMiddleName: json['employeeMiddleName'] as String?,
      accountId: json['accountId'] as int?,
      accountName: json['accountName'] as String?,
      createDate: json['createDate'] == null
          ? null
          : DateTime.parse(json['createDate'] as String),
      createBy: json['createBy'] as String?,
      fullNameUserCreate: json['fullNameUserCreate'] as String?,
      modifiedDate: json['modifiedDate'] == null
          ? null
          : DateTime.parse(json['modifiedDate'] as String),
      updateBy: json['updateBy'] as String?,
      fullNameUserUpdate: json['fullNameUserUpdate'] as String?,
      status: json['status'] as int?,
      startDate: json['startDate'] == null
          ? null
          : DateTime.parse(json['startDate'] as String),
      description: json['description'] as String?,
      opportunityTypeName: json['opportunityTypeName'] as String?,
      opportunityTypeId: json['opportunityTypeId'] as int?,
      leadSourceId: json['leadSourceId'] as int?,
      leadSourceName: json['leadSourceName'] as String?,
      opportunityStageReasonName: json['opportunityStageReasonName'] as String?,
      probability: (json['probability'] as num?)?.toDouble(),
      priceId: json['priceId'] as int?,
      opportunityStageReasonId: json['opportunityStageReasonId'] as int?,
    )
      ..amount = (json['amount'] as num?)?.toDouble()
      ..id = json['id'] as int?
      ..currencyExchangeRateId = json['currencyExchangeRateId'] as int?
      ..closeDate = json['closeDate'] == null
          ? null
          : DateTime.parse(json['closeDate'] as String)
      ..opportunityName = json['opportunityName'] as String?
      ..opportunityCode = json['opportunityCode'] as String?
      ..opportunityStageId = json['opportunityStageId'] as int?;

Map<String, dynamic> _$OpportunityInfoToJson(OpportunityInfo instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'id': instance.id,
      'currencyExchangeRateId': instance.currencyExchangeRateId,
      'closeDate': instance.closeDate?.toIso8601String(),
      'opportunityName': instance.opportunityName,
      'opportunityCode': instance.opportunityCode,
      'opportunityStageId': instance.opportunityStageId,
      'employeeId': instance.employeeId,
      'employeeFirstName': instance.employeeFirstName,
      'employeeLastName': instance.employeeLastName,
      'employeeMiddleName': instance.employeeMiddleName,
      'accountId': instance.accountId,
      'accountName': instance.accountName,
      'createDate': instance.createDate?.toIso8601String(),
      'createBy': instance.createBy,
      'fullNameUserCreate': instance.fullNameUserCreate,
      'modifiedDate': instance.modifiedDate?.toIso8601String(),
      'updateBy': instance.updateBy,
      'fullNameUserUpdate': instance.fullNameUserUpdate,
      'status': instance.status,
      'startDate': instance.startDate?.toIso8601String(),
      'description': instance.description,
      'opportunityTypeId': instance.opportunityTypeId,
      'opportunityTypeName': instance.opportunityTypeName,
      'leadSourceId': instance.leadSourceId,
      'leadSourceName': instance.leadSourceName,
      'opportunityStageReasonId': instance.opportunityStageReasonId,
      'opportunityStageReasonName': instance.opportunityStageReasonName,
      'probability': instance.probability,
      'priceId': instance.priceId,
    };
