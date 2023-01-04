// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'domain_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DomainItem _$DomainItemFromJson(Map<String, dynamic> json) => DomainItem(
      url: json['url'] as String?,
      apiUrl: json['api_url'] as String?,
      identityUrl: json['identity_url'] as String?,
    );

Map<String, dynamic> _$DomainItemToJson(DomainItem instance) =>
    <String, dynamic>{
      'url': instance.url,
      'api_url': instance.apiUrl,
      'identity_url': instance.identityUrl,
    };

DomainConfig _$DomainConfigFromJson(Map<String, dynamic> json) => DomainConfig(
      config: json['config'] == null
          ? null
          : DomainItem.fromJson(json['config'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DomainConfigToJson(DomainConfig instance) =>
    <String, dynamic>{
      'config': instance.config,
    };
