// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lead_format_address_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LeadFormatAddressResponse _$LeadFormatAddressResponseFromJson(
        Map<String, dynamic> json) =>
    LeadFormatAddressResponse(
      data: json['data'] == null
          ? null
          : LeadFormatAddress.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..code = json['code'] as String?
      ..success = json['success'] as bool? ?? false
      ..title = json['title'] as String?
      ..message = json['message'] as String?;

Map<String, dynamic> _$LeadFormatAddressResponseToJson(
        LeadFormatAddressResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'success': instance.success,
      'title': instance.title,
      'message': instance.message,
      'data': instance.data,
    };
