// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_qoute.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActivityQoute _$ActivityQouteFromJson(Map<String, dynamic> json) =>
    ActivityQoute(
      accountId: json['accountId'] as int?,
      id: json['id'] as int?,
      quoteName: json['quoteName'] as String?,
      quoteNumber: json['quoteNumber'] as String?,
      totalPrice: (json['totalPrice'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ActivityQouteToJson(ActivityQoute instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('accountId', instance.accountId);
  writeNotNull('id', instance.id);
  writeNotNull('quoteName', instance.quoteName);
  writeNotNull('quoteNumber', instance.quoteNumber);
  writeNotNull('totalPrice', instance.totalPrice);
  return val;
}
