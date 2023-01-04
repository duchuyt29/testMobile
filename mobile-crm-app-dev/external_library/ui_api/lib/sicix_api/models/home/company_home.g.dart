// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_home.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompanyHome _$CompanyHomeFromJson(Map<String, dynamic> json) => CompanyHome(
      id: json['id'] as int?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      domain: json['domain'] as String?,
      status: json['status'] as int?,
    );

Map<String, dynamic> _$CompanyHomeToJson(CompanyHome instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'domain': instance.domain,
      'status': instance.status,
    };
