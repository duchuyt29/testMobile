// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_opp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActivityOpp _$ActivityOppFromJson(Map<String, dynamic> json) => ActivityOpp(
      accountId: json['accountId'] as int?,
      id: json['id'] as int?,
      opportunityName: json['opportunityName'] as String?,
      opportunityCode: json['opportunityCode'] as String?,
      currencyExchangeRateId: json['currencyExchangeRateId'] as int?,
    );

Map<String, dynamic> _$ActivityOppToJson(ActivityOpp instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('accountId', instance.accountId);
  writeNotNull('id', instance.id);
  writeNotNull('opportunityName', instance.opportunityName);
  writeNotNull('opportunityCode', instance.opportunityCode);
  writeNotNull('currencyExchangeRateId', instance.currencyExchangeRateId);
  return val;
}
