// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserConfig _$UserConfigFromJson(Map<String, dynamic> json) => UserConfig(
      lastName: json['lastName'] as String?,
      configs: json['configs'] == null
          ? null
          : Configs.fromJson(json['configs'] as Map<String, dynamic>),
      groups: (json['groups'] as List<dynamic>?)
          ?.map((e) => Group.fromJson(e as Map<String, dynamic>))
          .toList(),
      avatar: json['avatar'] as String?,
      locale: json['locale'] as String?,
      firstName: json['firstName'] as String?,
      companyId: json['companyId'] as int?,
      companies: (json['companies'] as List<dynamic>?)
          ?.map((e) => Company.fromJson(e as Map<String, dynamic>))
          .toList(),
      lastCompany: json['lastCompany'] == null
          ? null
          : LastCompany.fromJson(json['lastCompany'] as Map<String, dynamic>),
      mainGroups: (json['mainGroups'] as List<dynamic>?)
          ?.map((e) => MainGroup.fromJson(e as Map<String, dynamic>))
          .toList(),
      signatureImage: json['signatureImage'],
      middleName: json['middleName'] as String?,
      id: json['id'] as String?,
      menuActions: json['menuActions'] == null
          ? null
          : MenuActions.fromJson(json['menuActions'] as Map<String, dynamic>),
      email: json['email'] as String?,
      username: json['username'] as String?,
      status: json['status'] as bool?,
      menuAllow: (json['menuAllow'] as List<dynamic>?)
          ?.map((e) => MenuAllow.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UserConfigToJson(UserConfig instance) =>
    <String, dynamic>{
      'lastName': instance.lastName,
      'configs': instance.configs,
      'groups': instance.groups,
      'avatar': instance.avatar,
      'locale': instance.locale,
      'firstName': instance.firstName,
      'companyId': instance.companyId,
      'companies': instance.companies,
      'lastCompany': instance.lastCompany,
      'mainGroups': instance.mainGroups,
      'signatureImage': instance.signatureImage,
      'middleName': instance.middleName,
      'id': instance.id,
      'menuActions': instance.menuActions,
      'email': instance.email,
      'username': instance.username,
      'status': instance.status,
      'menuAllow': instance.menuAllow,
    };
