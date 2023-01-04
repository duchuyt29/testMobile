// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lead_address_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LeadAddressRequest _$LeadAddressRequestFromJson(Map<String, dynamic> json) =>
    LeadAddressRequest(
      id: json['id'] as int?,
      leadAddressTypeId: json['leadAddressTypeId'] as int?,
      leadCountryId: json['leadCountryId'] as String?,
      leadProvinceId: json['leadProvinceId'] as int?,
      leadDistrictId: json['leadDistrictId'] as int?,
      leadWardId: json['leadWardId'] as int?,
      leadPostalCode: json['leadPostalCode'] as String?,
      leadStreet: json['leadStreet'] as String?,
    );

Map<String, dynamic> _$LeadAddressRequestToJson(LeadAddressRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('leadAddressTypeId', instance.leadAddressTypeId);
  writeNotNull('leadCountryId', instance.leadCountryId);
  writeNotNull('leadProvinceId', instance.leadProvinceId);
  writeNotNull('leadDistrictId', instance.leadDistrictId);
  writeNotNull('leadWardId', instance.leadWardId);
  writeNotNull('leadPostalCode', instance.leadPostalCode);
  writeNotNull('leadStreet', instance.leadStreet);
  return val;
}
