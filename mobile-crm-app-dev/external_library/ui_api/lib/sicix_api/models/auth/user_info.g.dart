// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserInfo _$UserInfoFromJson(Map<String, dynamic> json) => UserInfo(
      id: json['id'] as String?,
      companyId: json['companyId'] as int?,
      keycloakId: json['keycloakId'],
      username: json['username'] as String?,
      email: json['email'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      middleName: json['middleName'] as String?,
      fullName: json['fullName'] as String?,
      avatar: json['avatar'] as String?,
      signatureImage: json['signatureImage'],
      signatureText: json['signatureText'],
      phone: json['phone'] as String?,
      birthDate: json['birthDate'] == null
          ? null
          : DateTime.parse(json['birthDate'] as String),
      locale: json['locale'] as String?,
      state: json['state'] as String?,
      status: _convertStatus(json['status']),
      activeCert: json['activeCert'] as bool?,
      certs: json['certs'],
      orgs: json['orgs'],
    );

Map<String, dynamic> _$UserInfoToJson(UserInfo instance) => <String, dynamic>{
      'id': instance.id,
      'companyId': instance.companyId,
      'keycloakId': instance.keycloakId,
      'username': instance.username,
      'email': instance.email,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'middleName': instance.middleName,
      'fullName': instance.fullName,
      'avatar': instance.avatar,
      'signatureImage': instance.signatureImage,
      'signatureText': instance.signatureText,
      'phone': instance.phone,
      'birthDate': instance.birthDate?.toIso8601String(),
      'locale': instance.locale,
      'state': instance.state,
      'status': instance.status,
      'activeCert': instance.activeCert,
      'certs': instance.certs,
      'orgs': instance.orgs,
    };

UserInfos _$UserInfosFromJson(Map<String, dynamic> json) => UserInfos(
      (json['content'] as List<dynamic>?)
              ?.map((e) => UserInfo.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    )
      ..pageSize = json['pageSize'] as int?
      ..page = json['page'] as int?
      ..total = json['total'] as int?;

Map<String, dynamic> _$UserInfosToJson(UserInfos instance) => <String, dynamic>{
      'pageSize': instance.pageSize,
      'page': instance.page,
      'total': instance.total,
      'content': instance.content,
    };
