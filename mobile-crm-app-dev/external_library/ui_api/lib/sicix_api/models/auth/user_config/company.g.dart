// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Company _$CompanyFromJson(Map<String, dynamic> json) => Company(
      id: json['id'] as int?,
      name: json['name'] as String?,
      logo: json['logo'] as String?,
      icon: json['icon'] as String?,
      internationalName: json['internationalName'] as String?,
    );

Map<String, dynamic> _$CompanyToJson(Company instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'logo': instance.logo,
      'icon': instance.icon,
      'internationalName': instance.internationalName,
    };
