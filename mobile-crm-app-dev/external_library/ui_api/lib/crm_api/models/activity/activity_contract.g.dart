// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_contract.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActivityContract _$ActivityContractFromJson(Map<String, dynamic> json) =>
    ActivityContract(
      accountId: json['accountId'] as int?,
      id: json['id'] as int?,
      contractNumber: json['contractNumber'] as String?,
      contractNumberInput: json['contractNumberInput'] as String?,
      contractAccountId: json['contractAccountId'] as int?,
    );

Map<String, dynamic> _$ActivityContractToJson(ActivityContract instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('accountId', instance.accountId);
  writeNotNull('id', instance.id);
  writeNotNull('contractNumber', instance.contractNumber);
  writeNotNull('contractNumberInput', instance.contractNumberInput);
  writeNotNull('contractAccountId', instance.contractAccountId);
  return val;
}
