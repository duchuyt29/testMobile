// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'domain_sso.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DomainSso _$DomainSsoFromJson(Map<String, dynamic> json) => DomainSso(
      realm: json['realm'] as String?,
      resource: json['resource'] as String?,
      sslRequired: json['ssl-required'] as String?,
      publicClient: json['public-client'] as bool?,
      authServerUrl: json['auth-server-url'] as String?,
      confidentialPort: json['confidential-port'] as int?,
    );

Map<String, dynamic> _$DomainSsoToJson(DomainSso instance) => <String, dynamic>{
      'realm': instance.realm,
      'resource': instance.resource,
      'ssl-required': instance.sslRequired,
      'public-client': instance.publicClient,
      'auth-server-url': instance.authServerUrl,
      'confidential-port': instance.confidentialPort,
    };
