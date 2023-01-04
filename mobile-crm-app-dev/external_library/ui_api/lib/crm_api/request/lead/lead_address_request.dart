import 'package:json_annotation/json_annotation.dart';

part 'lead_address_request.g.dart';

@JsonSerializable(includeIfNull: false)
class LeadAddressRequest {
  int? id;
  int? leadAddressTypeId;
  String? leadCountryId;
  int? leadProvinceId;
  int? leadDistrictId;
  int? leadWardId;
  String? leadPostalCode;
  String? leadStreet;

  LeadAddressRequest({
    this.id,
    this.leadAddressTypeId,
    this.leadCountryId,
    this.leadProvinceId,
    this.leadDistrictId,
    this.leadWardId,
    this.leadPostalCode,
    this.leadStreet,
  });

  factory LeadAddressRequest.fromJson(Map<String, dynamic> json) {
    return _$LeadAddressRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LeadAddressRequestToJson(this);
}
