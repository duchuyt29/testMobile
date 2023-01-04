// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'last_company.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LastCompany _$LastCompanyFromJson(Map<String, dynamic> json) => LastCompany(
      name: json['name'] as String?,
      logo: json['logo'] as String?,
      icon: json['icon'],
      banner: json['banner'],
      background: json['background'],
      cssFileId: json['cssFileId'],
    );

Map<String, dynamic> _$LastCompanyToJson(LastCompany instance) =>
    <String, dynamic>{
      'name': instance.name,
      'logo': instance.logo,
      'icon': instance.icon,
      'banner': instance.banner,
      'background': instance.background,
      'cssFileId': instance.cssFileId,
    };
