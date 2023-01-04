import 'package:json_annotation/json_annotation.dart';
part 'account_address_request.g.dart';

@JsonSerializable()
class AccountAddressRequest {
  final int? accountId;
  @JsonKey(disallowNullValue: true)
  final int? id;
  final int? accountAddressTypeId;
  final String? accountAddressStreet;
  final int? accountAddressWardId;
  final int? accountAddressDistrictId;
  final int? accountAddressProvinceId;
  final String? accountAddressCountryId;
  final String? accountAddressPostalCode;
  final int? isMain;

  AccountAddressRequest({
    this.accountId,
    this.id,
    this.accountAddressTypeId,
    this.accountAddressStreet,
    this.accountAddressWardId,
    this.accountAddressDistrictId,
    this.accountAddressProvinceId,
    this.accountAddressCountryId,
    this.accountAddressPostalCode,
    this.isMain,
  });

  factory AccountAddressRequest.fromJson(Map<String, dynamic> json) =>
      _$AccountAddressRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AccountAddressRequestToJson(this);
}
