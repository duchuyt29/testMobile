// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'domain_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DomainResponse _$DomainResponseFromJson(Map<String, dynamic> json) =>
    DomainResponse(
      data: json['data'] == null
          ? null
          : DomainConfig.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..code = json['code'] as String?
      ..success = json['success'] as bool? ?? false
      ..title = json['title'] as String?
      ..message = json['message'] as String?;

Map<String, dynamic> _$DomainResponseToJson(DomainResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'success': instance.success,
      'title': instance.title,
      'message': instance.message,
      'data': instance.data,
    };
