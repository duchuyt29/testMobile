// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageUser _$MessageUserFromJson(Map<String, dynamic> json) => MessageUser(
      role: json['role'] as String?,
      name: json['name'] as String?,
      id: json['id'] as String?,
      partnerOnline: json['partnerOnline'] as bool?,
    );

Map<String, dynamic> _$MessageUserToJson(MessageUser instance) =>
    <String, dynamic>{
      'role': instance.role,
      'name': instance.name,
      'id': instance.id,
      'partnerOnline': instance.partnerOnline,
    };
