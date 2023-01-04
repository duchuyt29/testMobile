import 'package:json_annotation/json_annotation.dart';
import 'package:sicix/shared/utils/app_util.dart';
import 'package:sicix/shared/utils/date_util.dart';

import '../../../sicix_api/models/base_models.dart';
import 'account_address.dart';
import 'account_document.dart';

part 'account.g.dart';

@JsonSerializable()
class Account {
  final String? accountBillingDistrictName;
  final String? ownerEmployeeFirstName;
  final String? modifiedDate;
  final String? accountName;
  final String? accountDescription;
  final String? accountBillingCountryName;
  final String? accountBillingProvinceName;
  final String? ownerEmployeeLastName;
  final String? createDate;
  final int? accountBillingDistrictId;
  final int? isActive;
  final int? parentAccountId;
  final String? parentAccountName;
  final int? industryId;
  final String? industryName;

  final String? accountBillingCountryId;
  final String? ownerEmployeeMiddleName;
  final int? accountBillingProvinceId;
  final int? genderId;
  final String? genderName;
  final String? updateBy;
  final String? accountEmail;
  final String? accountBillingPostalCode;
  final int? accountBillingWardId;
  final int? accountTypeId;
  final String? accountTypeName;
  final int? ownerEmployeeId;
  final String? accountBillingStreet;
  final String? accountCode;
  final String? accountPhone;
  final String? createBy;
  final int? status;
  final int? id;
  final String? accountBillingWardName;

  Account({
    this.accountBillingDistrictName,
    this.ownerEmployeeFirstName,
    this.modifiedDate,
    this.accountName,
    this.accountDescription,
    this.accountBillingCountryName,
    this.accountBillingProvinceName,
    this.ownerEmployeeLastName,
    this.createDate,
    this.accountBillingDistrictId,
    this.isActive,
    this.parentAccountId,
    this.parentAccountName,
    this.industryId,
    this.industryName,
    this.accountBillingCountryId,
    this.ownerEmployeeMiddleName,
    this.accountBillingProvinceId,
    this.genderId,
    this.genderName,
    this.updateBy,
    this.accountEmail,
    this.accountBillingPostalCode,
    this.accountBillingWardId,
    this.accountTypeId,
    this.accountTypeName,
    this.ownerEmployeeId,
    this.accountBillingStreet,
    this.accountCode,
    this.accountPhone,
    this.createBy,
    this.status,
    this.id,
    this.accountBillingWardName,
  });

  factory Account.fromJson(Map<String, dynamic> json) {
    return _$AccountFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AccountToJson(this);

  String getOwnerEmployeeName() {
    final nameOption = <String>[];
    if (ownerEmployeeLastName != null) {
      nameOption.add(ownerEmployeeLastName ?? '');
    }
    if (ownerEmployeeMiddleName != null) {
      nameOption.add(ownerEmployeeMiddleName ?? '');
    }
    if (ownerEmployeeFirstName != null) {
      nameOption.add(ownerEmployeeFirstName ?? '');
    }
    return nameOption.join(' ');
  }
}

@JsonSerializable()
class Accounts extends BaseModels {
  @JsonKey(defaultValue: [])
  List<Account> content;

  Accounts(this.content);

  factory Accounts.fromJson(Map<String, dynamic> json) =>
      _$AccountsFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$AccountsToJson(this);
}

@JsonSerializable()
class AccountInfo {
  String? accountBillingDistrictName;
  String? ownerEmployeeFirstName;
  @JsonKey(toJson: _dateToString)
  DateTime? modifiedDate;
  String? accountName;
  String? accountDescription;
  String? accountBillingCountryName;
  String? accountBillingProvinceName;
  String? ownerEmployeeLastName;
  @JsonKey(toJson: _dateToString)
  DateTime? createDate;
  int? accountBillingDistrictId;
  int? isActive;
  int? parentAccountId;
  String? parentAccountName;
  int? industryId;
  String? industryName;

  String? accountBillingCountryId;
  String? ownerEmployeeMiddleName;
  int? accountBillingProvinceId;
  int? genderId;
  String? genderName;
  String? updateBy;
  String? accountEmail;
  String? accountBillingPostalCode;
  int? accountBillingWardId;
  int? accountTypeId;
  String? accountTypeName;
  int? ownerEmployeeId;
  String? accountBillingStreet;
  String? accountCode;
  String? accountPhone;
  String? createBy;
  int? status;
  int? id;
  String? accountBillingWardName;
  @JsonKey(defaultValue: [])
  List<AccountDocument>? accountDocuments;
  @JsonKey(defaultValue: [])
  List<AccountAddress>? accountAddresses;
  String? fullNameUserCreate;
  String? fullNameUserUpdate;
  String? accountPhoneSecond;
  String? accountUUID;

  AccountInfo({
    this.accountBillingDistrictName,
    this.ownerEmployeeFirstName,
    this.modifiedDate,
    this.accountName,
    this.accountDescription,
    this.accountBillingCountryName,
    this.accountBillingProvinceName,
    this.ownerEmployeeLastName,
    this.createDate,
    this.accountBillingDistrictId,
    this.isActive,
    this.parentAccountId,
    this.parentAccountName,
    this.industryId,
    this.industryName,
    this.accountBillingCountryId,
    this.ownerEmployeeMiddleName,
    this.accountBillingProvinceId,
    this.genderId,
    this.genderName,
    this.updateBy,
    this.accountEmail,
    this.accountBillingPostalCode,
    this.accountBillingWardId,
    this.accountTypeId,
    this.accountTypeName,
    this.ownerEmployeeId,
    this.accountBillingStreet,
    this.accountCode,
    this.accountPhone,
    this.createBy,
    this.status,
    this.id,
    this.accountBillingWardName,
    this.accountDocuments,
    this.accountAddresses,
    this.fullNameUserCreate,
    this.fullNameUserUpdate,
    this.accountPhoneSecond,
    this.accountUUID,
  });

  factory AccountInfo.fromJson(Map<String, dynamic> json) =>
      _$AccountInfoFromJson(json);

  Map<String, dynamic> toJson() => _$AccountInfoToJson(this);

  String getOwnerEmployeeName() {
    final nameOption = <String>[];
    if (ownerEmployeeLastName != null) {
      nameOption.add(ownerEmployeeLastName ?? '');
    }
    if (ownerEmployeeMiddleName != null) {
      nameOption.add(ownerEmployeeMiddleName ?? '');
    }
    if (ownerEmployeeFirstName != null) {
      nameOption.add(ownerEmployeeFirstName ?? '');
    }
    return nameOption.join(' ');
  }

  String getCreateAtContent() {
    return '${fullNameUserCreate ?? ''}, ${DateUtil.formatDatetimeToString(createDate, type: DateUtil.DATETIME_TYPE)} ';
  }

  String getUpdateAtContent() {
    return '${fullNameUserUpdate ?? ''}, ${DateUtil.formatDatetimeToString(modifiedDate, type: DateUtil.DATETIME_TYPE)} ';
  }

  String getAccountNameAndCode() {
    return '${accountName ?? ''}_${accountCode ?? ''}';
  }

  String getAccountBilling() {
    var address = '';
    if (accountAddresses != null && accountAddresses!.isNotEmpty) {
      final accountBilling =
          accountAddresses!.firstWhere((element) => element.isMain == 1);
      if (accountBilling != null) {
        address = accountBilling.accountAddressProvinceName ?? '';
      }
    }
    return address;
  }
}

String? _dateToString(DateTime? date) {
  // return date?.toUtc().toString() ?? '';
  if (date == null) {
    return null;
  }
  return DateUtil.formatDatetimeToString(date.toUtc(), type: DateUtil.API_TYPE);
}
