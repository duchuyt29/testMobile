// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_chat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserChatModel _$UserChatModelFromJson(Map<String, dynamic> json) =>
    UserChatModel(
      id: json['id'] as String?,
      companyId: json['companyId'] as int?,
      username: json['username'] as String?,
      fullName: json['fullName'] as String?,
      locale: json['locale'] as String?,
      avatar: json['avatar'] as String?,
      status: json['status'] as int?,
      dataScope: json['dataScope'],
    );

Map<String, dynamic> _$UserChatModelToJson(UserChatModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'companyId': instance.companyId,
      'username': instance.username,
      'fullName': instance.fullName,
      'locale': instance.locale,
      'avatar': instance.avatar,
      'status': instance.status,
      'dataScope': instance.dataScope,
    };
