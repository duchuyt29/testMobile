// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountAddress _$AccountAddressFromJson(Map<String, dynamic> json) =>
    AccountAddress(
      createDate: json['createDate'] as String?,
      modifiedDate: json['modifiedDate'] as String?,
      status: json['status'] as int?,
      createBy: json['createBy'] as String?,
      updateBy: json['updateBy'] as String?,
      id: json['id'] as int?,
      accountId: json['accountId'] as int?,
      accountAddressTypeId: json['accountAddressTypeId'] as int?,
      accountAddressTypeName: json['accountAddressTypeName'] as String?,
      accountAddressStreet: json['accountAddressStreet'] as String?,
      accountAddressWardId: json['accountAddressWardId'] as int?,
      accountAddressWardName: json['accountAddressWardName'] as String?,
      accountAddressDistrictId: json['accountAddressDistrictId'] as int?,
      accountAddressDistrictName: json['accountAddressDistrictName'] as String?,
      accountAddressProvinceId: json['accountAddressProvinceId'] as int?,
      accountAddressProvinceName: json['accountAddressProvinceName'] as String?,
      accountAddressCountryId: json['accountAddressCountryId'] as String?,
      accountAddressCountryName: json['accountAddressCountryName'] as String?,
      accountAddressPostalCode: json['accountAddressPostalCode'] as String?,
      isMain: json['isMain'] as int? ?? 0,
    );

Map<String, dynamic> _$AccountAddressToJson(AccountAddress instance) =>
    <String, dynamic>{
      'createDate': instance.createDate,
      'modifiedDate': instance.modifiedDate,
      'status': instance.status,
      'createBy': instance.createBy,
      'updateBy': instance.updateBy,
      'id': instance.id,
      'accountId': instance.accountId,
      'accountAddressTypeId': instance.accountAddressTypeId,
      'accountAddressTypeName': instance.accountAddressTypeName,
      'accountAddressStreet': instance.accountAddressStreet,
      'accountAddressWardId': instance.accountAddressWardId,
      'accountAddressWardName': instance.accountAddressWardName,
      'accountAddressDistrictId': instance.accountAddressDistrictId,
      'accountAddressDistrictName': instance.accountAddressDistrictName,
      'accountAddressProvinceId': instance.accountAddressProvinceId,
      'accountAddressProvinceName': instance.accountAddressProvinceName,
      'accountAddressCountryId': instance.accountAddressCountryId,
      'accountAddressCountryName': instance.accountAddressCountryName,
      'accountAddressPostalCode': instance.accountAddressPostalCode,
      'isMain': instance.isMain,
    };
