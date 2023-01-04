// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_address_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountAddressType _$AccountAddressTypeFromJson(Map<String, dynamic> json) =>
    AccountAddressType(
      id: json['id'] as int?,
      accountAddressTypeName: json['accountAddressTypeName'] as String?,
      status: json['status'] as int?,
    );

Map<String, dynamic> _$AccountAddressTypeToJson(AccountAddressType instance) =>
    <String, dynamic>{
      'id': instance.id,
      'accountAddressTypeName': instance.accountAddressTypeName,
      'status': instance.status,
    };
