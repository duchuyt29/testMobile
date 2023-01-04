// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_address_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountAddressRequest _$AccountAddressRequestFromJson(
    Map<String, dynamic> json) {
  $checkKeys(
    json,
    disallowNullValues: const ['id'],
  );
  return AccountAddressRequest(
    accountId: json['accountId'] as int?,
    id: json['id'] as int?,
    accountAddressTypeId: json['accountAddressTypeId'] as int?,
    accountAddressStreet: json['accountAddressStreet'] as String?,
    accountAddressWardId: json['accountAddressWardId'] as int?,
    accountAddressDistrictId: json['accountAddressDistrictId'] as int?,
    accountAddressProvinceId: json['accountAddressProvinceId'] as int?,
    accountAddressCountryId: json['accountAddressCountryId'] as String?,
    accountAddressPostalCode: json['accountAddressPostalCode'] as String?,
    isMain: json['isMain'] as int?,
  );
}

Map<String, dynamic> _$AccountAddressRequestToJson(
    AccountAddressRequest instance) {
  final val = <String, dynamic>{
    'accountId': instance.accountId,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  val['accountAddressTypeId'] = instance.accountAddressTypeId;
  val['accountAddressStreet'] = instance.accountAddressStreet;
  val['accountAddressWardId'] = instance.accountAddressWardId;
  val['accountAddressDistrictId'] = instance.accountAddressDistrictId;
  val['accountAddressProvinceId'] = instance.accountAddressProvinceId;
  val['accountAddressCountryId'] = instance.accountAddressCountryId;
  val['accountAddressPostalCode'] = instance.accountAddressPostalCode;
  val['isMain'] = instance.isMain;
  return val;
}
