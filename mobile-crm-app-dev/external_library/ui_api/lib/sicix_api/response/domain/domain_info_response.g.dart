// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'domain_info_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DomainInfoResponse _$DomainInfoResponseFromJson(Map<String, dynamic> json) =>
    DomainInfoResponse(
      data: json['data'] == null
          ? null
          : DomainInfo.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..code = json['code'] as String?
      ..success = json['success'] as bool? ?? false
      ..title = json['title'] as String?
      ..message = json['message'] as String?;

Map<String, dynamic> _$DomainInfoResponseToJson(DomainInfoResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'success': instance.success,
      'title': instance.title,
      'message': instance.message,
      'data': instance.data,
    };
