// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency_exchange_rate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrencyExchangeRate _$CurrencyExchangeRateFromJson(
        Map<String, dynamic> json) =>
    CurrencyExchangeRate(
      id: json['id'] as int?,
      isDefault: json['isDefault'] as int?,
      conversionRate: (json['conversionRate'] as num?)?.toDouble(),
      currencyName: json['currencyName'] as String?,
      currencyCode: json['currencyCode'] as String?,
      currencyId: json['currencyId'] as int?,
      decimalPlace: json['decimalPlace'] as int?,
    );

Map<String, dynamic> _$CurrencyExchangeRateToJson(
        CurrencyExchangeRate instance) =>
    <String, dynamic>{
      'id': instance.id,
      'isDefault': instance.isDefault,
      'conversionRate': instance.conversionRate,
      'currencyName': instance.currencyName,
      'currencyCode': instance.currencyCode,
      'currencyId': instance.currencyId,
      'decimalPlace': instance.decimalPlace,
    };
