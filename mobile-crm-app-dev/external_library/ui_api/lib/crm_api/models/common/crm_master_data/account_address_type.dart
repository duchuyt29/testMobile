import 'package:json_annotation/json_annotation.dart';

part 'account_address_type.g.dart';

@JsonSerializable()
class AccountAddressType {
  static final home =
      AccountAddressType(id: 1, accountAddressTypeName: 'Nhà riêng', status: 1);

  int? id;
  String? accountAddressTypeName;
  int? status;

  AccountAddressType({
    this.id,
    this.accountAddressTypeName,
    this.status,
  });

  factory AccountAddressType.fromJson(Map<String, dynamic> json) {
    return _$AccountAddressTypeFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AccountAddressTypeToJson(this);
}
