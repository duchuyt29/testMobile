// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FilterRequest _$FilterRequestFromJson(Map<String, dynamic> json) =>
    FilterRequest(
      genderId: json['genderId'] as int? ?? 0,
      countryId: json['countryId'] as String? ?? '',
      provinceId: json['provinceId'] as int? ?? 0,
      provinceName: json['provinceName'] as String?,
      districtId: json['districtId'] as int? ?? 0,
      districtName: json['districtName'] as String?,
      wardId: json['wardId'] as int? ?? 0,
      wardName: json['wardName'] as String?,
    );

Map<String, dynamic> _$FilterRequestToJson(FilterRequest instance) =>
    <String, dynamic>{
      'genderId': instance.genderId,
      'countryId': instance.countryId,
      'provinceId': instance.provinceId,
      'provinceName': instance.provinceName,
      'districtId': instance.districtId,
      'districtName': instance.districtName,
      'wardId': instance.wardId,
      'wardName': instance.wardName,
    };
