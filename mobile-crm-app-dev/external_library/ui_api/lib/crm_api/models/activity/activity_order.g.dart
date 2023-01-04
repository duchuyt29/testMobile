// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActivityOrder _$ActivityOrderFromJson(Map<String, dynamic> json) =>
    ActivityOrder(
      accountId: json['accountId'] as int?,
      id: json['id'] as int?,
      orderNumber: json['orderNumber'] as String?,
    );

Map<String, dynamic> _$ActivityOrderToJson(ActivityOrder instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('accountId', instance.accountId);
  writeNotNull('id', instance.id);
  writeNotNull('orderNumber', instance.orderNumber);
  return val;
}
