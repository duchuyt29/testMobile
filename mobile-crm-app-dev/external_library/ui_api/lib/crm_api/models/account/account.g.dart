// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Account _$AccountFromJson(Map<String, dynamic> json) => Account(
      accountBillingDistrictName: json['accountBillingDistrictName'] as String?,
      ownerEmployeeFirstName: json['ownerEmployeeFirstName'] as String?,
      modifiedDate: json['modifiedDate'] as String?,
      accountName: json['accountName'] as String?,
      accountDescription: json['accountDescription'] as String?,
      accountBillingCountryName: json['accountBillingCountryName'] as String?,
      accountBillingProvinceName: json['accountBillingProvinceName'] as String?,
      ownerEmployeeLastName: json['ownerEmployeeLastName'] as String?,
      createDate: json['createDate'] as String?,
      accountBillingDistrictId: json['accountBillingDistrictId'] as int?,
      isActive: json['isActive'] as int?,
      parentAccountId: json['parentAccountId'] as int?,
      parentAccountName: json['parentAccountName'] as String?,
      industryId: json['industryId'] as int?,
      industryName: json['industryName'] as String?,
      accountBillingCountryId: json['accountBillingCountryId'] as String?,
      ownerEmployeeMiddleName: json['ownerEmployeeMiddleName'] as String?,
      accountBillingProvinceId: json['accountBillingProvinceId'] as int?,
      genderId: json['genderId'] as int?,
      genderName: json['genderName'] as String?,
      updateBy: json['updateBy'] as String?,
      accountEmail: json['accountEmail'] as String?,
      accountBillingPostalCode: json['accountBillingPostalCode'] as String?,
      accountBillingWardId: json['accountBillingWardId'] as int?,
      accountTypeId: json['accountTypeId'] as int?,
      accountTypeName: json['accountTypeName'] as String?,
      ownerEmployeeId: json['ownerEmployeeId'] as int?,
      accountBillingStreet: json['accountBillingStreet'] as String?,
      accountCode: json['accountCode'] as String?,
      accountPhone: json['accountPhone'] as String?,
      createBy: json['createBy'] as String?,
      status: json['status'] as int?,
      id: json['id'] as int?,
      accountBillingWardName: json['accountBillingWardName'] as String?,
    );

Map<String, dynamic> _$AccountToJson(Account instance) => <String, dynamic>{
      'accountBillingDistrictName': instance.accountBillingDistrictName,
      'ownerEmployeeFirstName': instance.ownerEmployeeFirstName,
      'modifiedDate': instance.modifiedDate,
      'accountName': instance.accountName,
      'accountDescription': instance.accountDescription,
      'accountBillingCountryName': instance.accountBillingCountryName,
      'accountBillingProvinceName': instance.accountBillingProvinceName,
      'ownerEmployeeLastName': instance.ownerEmployeeLastName,
      'createDate': instance.createDate,
      'accountBillingDistrictId': instance.accountBillingDistrictId,
      'isActive': instance.isActive,
      'parentAccountId': instance.parentAccountId,
      'parentAccountName': instance.parentAccountName,
      'industryId': instance.industryId,
      'industryName': instance.industryName,
      'accountBillingCountryId': instance.accountBillingCountryId,
      'ownerEmployeeMiddleName': instance.ownerEmployeeMiddleName,
      'accountBillingProvinceId': instance.accountBillingProvinceId,
      'genderId': instance.genderId,
      'genderName': instance.genderName,
      'updateBy': instance.updateBy,
      'accountEmail': instance.accountEmail,
      'accountBillingPostalCode': instance.accountBillingPostalCode,
      'accountBillingWardId': instance.accountBillingWardId,
      'accountTypeId': instance.accountTypeId,
      'accountTypeName': instance.accountTypeName,
      'ownerEmployeeId': instance.ownerEmployeeId,
      'accountBillingStreet': instance.accountBillingStreet,
      'accountCode': instance.accountCode,
      'accountPhone': instance.accountPhone,
      'createBy': instance.createBy,
      'status': instance.status,
      'id': instance.id,
      'accountBillingWardName': instance.accountBillingWardName,
    };

Accounts _$AccountsFromJson(Map<String, dynamic> json) => Accounts(
      (json['content'] as List<dynamic>?)
              ?.map((e) => Account.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    )
      ..pageSize = json['pageSize'] as int?
      ..page = json['page'] as int?
      ..total = json['total'] as int?;

Map<String, dynamic> _$AccountsToJson(Accounts instance) => <String, dynamic>{
      'pageSize': instance.pageSize,
      'page': instance.page,
      'total': instance.total,
      'content': instance.content,
    };

AccountInfo _$AccountInfoFromJson(Map<String, dynamic> json) => AccountInfo(
      accountBillingDistrictName: json['accountBillingDistrictName'] as String?,
      ownerEmployeeFirstName: json['ownerEmployeeFirstName'] as String?,
      modifiedDate: json['modifiedDate'] == null
          ? null
          : DateTime.parse(json['modifiedDate'] as String),
      accountName: json['accountName'] as String?,
      accountDescription: json['accountDescription'] as String?,
      accountBillingCountryName: json['accountBillingCountryName'] as String?,
      accountBillingProvinceName: json['accountBillingProvinceName'] as String?,
      ownerEmployeeLastName: json['ownerEmployeeLastName'] as String?,
      createDate: json['createDate'] == null
          ? null
          : DateTime.parse(json['createDate'] as String),
      accountBillingDistrictId: json['accountBillingDistrictId'] as int?,
      isActive: json['isActive'] as int?,
      parentAccountId: json['parentAccountId'] as int?,
      parentAccountName: json['parentAccountName'] as String?,
      industryId: json['industryId'] as int?,
      industryName: json['industryName'] as String?,
      accountBillingCountryId: json['accountBillingCountryId'] as String?,
      ownerEmployeeMiddleName: json['ownerEmployeeMiddleName'] as String?,
      accountBillingProvinceId: json['accountBillingProvinceId'] as int?,
      genderId: json['genderId'] as int?,
      genderName: json['genderName'] as String?,
      updateBy: json['updateBy'] as String?,
      accountEmail: json['accountEmail'] as String?,
      accountBillingPostalCode: json['accountBillingPostalCode'] as String?,
      accountBillingWardId: json['accountBillingWardId'] as int?,
      accountTypeId: json['accountTypeId'] as int?,
      accountTypeName: json['accountTypeName'] as String?,
      ownerEmployeeId: json['ownerEmployeeId'] as int?,
      accountBillingStreet: json['accountBillingStreet'] as String?,
      accountCode: json['accountCode'] as String?,
      accountPhone: json['accountPhone'] as String?,
      createBy: json['createBy'] as String?,
      status: json['status'] as int?,
      id: json['id'] as int?,
      accountBillingWardName: json['accountBillingWardName'] as String?,
      accountDocuments: (json['accountDocuments'] as List<dynamic>?)
              ?.map((e) => AccountDocument.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      accountAddresses: (json['accountAddresses'] as List<dynamic>?)
              ?.map((e) => AccountAddress.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      fullNameUserCreate: json['fullNameUserCreate'] as String?,
      fullNameUserUpdate: json['fullNameUserUpdate'] as String?,
      accountPhoneSecond: json['accountPhoneSecond'] as String?,
      accountUUID: json['accountUUID'] as String?,
    );

Map<String, dynamic> _$AccountInfoToJson(AccountInfo instance) =>
    <String, dynamic>{
      'accountBillingDistrictName': instance.accountBillingDistrictName,
      'ownerEmployeeFirstName': instance.ownerEmployeeFirstName,
      'modifiedDate': _dateToString(instance.modifiedDate),
      'accountName': instance.accountName,
      'accountDescription': instance.accountDescription,
      'accountBillingCountryName': instance.accountBillingCountryName,
      'accountBillingProvinceName': instance.accountBillingProvinceName,
      'ownerEmployeeLastName': instance.ownerEmployeeLastName,
      'createDate': _dateToString(instance.createDate),
      'accountBillingDistrictId': instance.accountBillingDistrictId,
      'isActive': instance.isActive,
      'parentAccountId': instance.parentAccountId,
      'parentAccountName': instance.parentAccountName,
      'industryId': instance.industryId,
      'industryName': instance.industryName,
      'accountBillingCountryId': instance.accountBillingCountryId,
      'ownerEmployeeMiddleName': instance.ownerEmployeeMiddleName,
      'accountBillingProvinceId': instance.accountBillingProvinceId,
      'genderId': instance.genderId,
      'genderName': instance.genderName,
      'updateBy': instance.updateBy,
      'accountEmail': instance.accountEmail,
      'accountBillingPostalCode': instance.accountBillingPostalCode,
      'accountBillingWardId': instance.accountBillingWardId,
      'accountTypeId': instance.accountTypeId,
      'accountTypeName': instance.accountTypeName,
      'ownerEmployeeId': instance.ownerEmployeeId,
      'accountBillingStreet': instance.accountBillingStreet,
      'accountCode': instance.accountCode,
      'accountPhone': instance.accountPhone,
      'createBy': instance.createBy,
      'status': instance.status,
      'id': instance.id,
      'accountBillingWardName': instance.accountBillingWardName,
      'accountDocuments': instance.accountDocuments,
      'accountAddresses': instance.accountAddresses,
      'fullNameUserCreate': instance.fullNameUserCreate,
      'fullNameUserUpdate': instance.fullNameUserUpdate,
      'accountPhoneSecond': instance.accountPhoneSecond,
      'accountUUID': instance.accountUUID,
    };
