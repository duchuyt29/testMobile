// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_allow.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MenuAllow _$MenuAllowFromJson(Map<String, dynamic> json) => MenuAllow(
      code: json['code'] as String?,
      application: json['application'] as String?,
      parentCode: json['parentCode'] as String?,
      sortOrder: json['sortOrder'] as int?,
      icon: json['icon'],
      name: json['name'] as String?,
      type: json['type'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$MenuAllowToJson(MenuAllow instance) => <String, dynamic>{
      'code': instance.code,
      'application': instance.application,
      'parentCode': instance.parentCode,
      'sortOrder': instance.sortOrder,
      'icon': instance.icon,
      'name': instance.name,
      'type': instance.type,
      'url': instance.url,
    };
