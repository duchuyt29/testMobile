// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_filter_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountFilterRequest _$AccountFilterRequestFromJson(
        Map<String, dynamic> json) =>
    AccountFilterRequest(
      ownerEmployee: (json['ownerEmployee'] as List<dynamic>?)
          ?.map((e) => EmployeeModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      industryId: json['industryId'] as int?,
      accountTypeId: json['accountTypeId'] as int?,
      genderId: json['genderId'] as int?,
      relativeAccount: json['relativeAccount'] == null
          ? null
          : ActivityAccount.fromJson(
              json['relativeAccount'] as Map<String, dynamic>),
      relativeContact: (json['relativeContact'] as List<dynamic>?)
          ?.map((e) => Contact.fromJson(e as Map<String, dynamic>))
          .toList(),
      accountBillingCountryId: json['accountBillingCountryId'] as String? ?? '',
      accountBillingProvince: json['accountBillingProvince'] == null
          ? null
          : Province.fromJson(
              json['accountBillingProvince'] as Map<String, dynamic>),
      accountBillingDistrict: json['accountBillingDistrict'] == null
          ? null
          : District.fromJson(
              json['accountBillingDistrict'] as Map<String, dynamic>),
      accountBillingWard: json['accountBillingWard'] == null
          ? null
          : Ward.fromJson(json['accountBillingWard'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AccountFilterRequestToJson(
        AccountFilterRequest instance) =>
    <String, dynamic>{
      'ownerEmployee': instance.ownerEmployee,
      'accountTypeId': instance.accountTypeId,
      'industryId': instance.industryId,
      'relativeContact': instance.relativeContact,
      'relativeAccount': instance.relativeAccount,
      'genderId': instance.genderId,
      'accountBillingCountryId': instance.accountBillingCountryId,
      'accountBillingProvince': instance.accountBillingProvince,
      'accountBillingDistrict': instance.accountBillingDistrict,
      'accountBillingWard': instance.accountBillingWard,
    };
