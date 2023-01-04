// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'configs.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Configs _$ConfigsFromJson(Map<String, dynamic> json) => Configs(
      lastCompanyId: _stringToInt(json['lastCompanyId']),
      themes: json['themes'] == null
          ? null
          : Themes.fromJson(json['themes'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ConfigsToJson(Configs instance) => <String, dynamic>{
      'lastCompanyId': instance.lastCompanyId,
      'themes': instance.themes?.toJson(),
    };
