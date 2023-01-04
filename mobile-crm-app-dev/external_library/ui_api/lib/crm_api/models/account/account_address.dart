import 'package:json_annotation/json_annotation.dart';

import '../../../sicix_api/models/base_models.dart';

part 'account_address.g.dart';

@JsonSerializable()
class AccountAddress {
  String? createDate;
  String? modifiedDate;
  int? status;
  String? createBy;
  String? updateBy;
  int? id;
  int? accountId;
  int? accountAddressTypeId;
  String? accountAddressTypeName;
  String? accountAddressStreet;
  int? accountAddressWardId;
  String? accountAddressWardName;
  int? accountAddressDistrictId;
  String? accountAddressDistrictName;
  int? accountAddressProvinceId;
  String? accountAddressProvinceName;
  String? accountAddressCountryId;
  String? accountAddressCountryName;
  String? accountAddressPostalCode;
  @JsonKey(defaultValue: 0)
  int? isMain;

  AccountAddress(
      {this.createDate,
      this.modifiedDate,
      this.status,
      this.createBy,
      this.updateBy,
      this.id,
      this.accountId,
      this.accountAddressTypeId,
      this.accountAddressTypeName,
      this.accountAddressStreet,
      this.accountAddressWardId,
      this.accountAddressWardName,
      this.accountAddressDistrictId,
      this.accountAddressDistrictName,
      this.accountAddressProvinceId,
      this.accountAddressProvinceName,
      this.accountAddressCountryId,
      this.accountAddressCountryName,
      this.accountAddressPostalCode,
      this.isMain});

  factory AccountAddress.fromJson(Map<String, dynamic> json) {
    return _$AccountAddressFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AccountAddressToJson(this);

  String getFullAddress() {
    final nameOption = <String>[];
    if (accountAddressTypeName != null) {
      nameOption.add(accountAddressTypeName ?? '');
    }
    if (accountAddressPostalCode != null) {
      nameOption.add(accountAddressPostalCode ?? '');
    }
    if (accountAddressStreet != null) {
      nameOption.add(accountAddressStreet ?? '');
    }
    if (accountAddressWardName != null) {
      nameOption.add(accountAddressWardName ?? '');
    }
    if (accountAddressDistrictName != null) {
      nameOption.add(accountAddressDistrictName ?? '');
    }
    if (accountAddressProvinceName != null) {
      nameOption.add(accountAddressProvinceName ?? '');
    }
    if (accountAddressCountryName != null) {
      nameOption.add(accountAddressCountryName ?? '');
    }

    return nameOption.join(', ');
  }
}
