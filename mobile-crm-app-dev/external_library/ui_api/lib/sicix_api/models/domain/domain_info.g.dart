// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'domain_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DomainInfo _$DomainInfoFromJson(Map<String, dynamic> json) => DomainInfo(
      sso: json['sso'] == null
          ? null
          : DomainSso.fromJson(json['sso'] as Map<String, dynamic>),
      url: json['url'] == null
          ? null
          : DomainUrl.fromJson(json['url'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DomainInfoToJson(DomainInfo instance) =>
    <String, dynamic>{
      'sso': instance.sso,
      'url': instance.url,
    };
