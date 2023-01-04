// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lead_format_address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LeadFormatAddress _$LeadFormatAddressFromJson(Map<String, dynamic> json) =>
    LeadFormatAddress(
      address: json['address'] as String?,
      wardId: json['wardId'] as int?,
      wardName: json['wardName'] as String?,
      districtId: json['districtId'] as int?,
      districtName: json['districtName'] as String?,
      provinceId: json['provinceId'] as int?,
      provinceName: json['provinceName'] as String?,
    );

Map<String, dynamic> _$LeadFormatAddressToJson(LeadFormatAddress instance) =>
    <String, dynamic>{
      'address': instance.address,
      'wardId': instance.wardId,
      'wardName': instance.wardName,
      'districtId': instance.districtId,
      'districtName': instance.districtName,
      'provinceId': instance.provinceId,
      'provinceName': instance.provinceName,
    };
