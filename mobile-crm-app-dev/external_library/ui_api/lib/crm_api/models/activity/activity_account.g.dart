// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActivityAccount _$ActivityAccountFromJson(Map<String, dynamic> json) =>
    ActivityAccount(
      id: json['id'] as int?,
      accountName: json['accountName'] as String?,
    );

Map<String, dynamic> _$ActivityAccountToJson(ActivityAccount instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('accountName', instance.accountName);
  return val;
}
