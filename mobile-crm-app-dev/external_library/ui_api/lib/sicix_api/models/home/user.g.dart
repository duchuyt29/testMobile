// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as String?,
      companyId: json['companyId'] as int?,
      username: json['username'] as String?,
      fullName: json['fullName'] as String?,
      locale: json['locale'] as String?,
      status: json['status'] as int?,
      avatar: json['avatar'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'companyId': instance.companyId,
      'username': instance.username,
      'fullName': instance.fullName,
      'locale': instance.locale,
      'status': instance.status,
      'avatar': instance.avatar,
    };
