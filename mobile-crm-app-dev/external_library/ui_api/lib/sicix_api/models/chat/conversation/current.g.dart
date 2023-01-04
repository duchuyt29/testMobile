// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Current _$CurrentFromJson(Map<String, dynamic> json) => Current(
      unread: json['unread'] as int?,
      lastMessage: json['lastMessage'] as String?,
      active: json['active'] as int?,
      lastRead: json['lastRead'] == null
          ? null
          : DateTime.parse(json['lastRead'] as String),
    );

Map<String, dynamic> _$CurrentToJson(Current instance) => <String, dynamic>{
      'unread': instance.unread,
      'lastMessage': instance.lastMessage,
      'active': instance.active,
      'lastRead': instance.lastRead?.toIso8601String(),
    };
