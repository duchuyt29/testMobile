// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_conversation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserConversation _$UserConversationFromJson(Map<String, dynamic> json) =>
    UserConversation(
      role: json['role'] as String?,
      name: json['name'] as String?,
      id: json['id'] as String?,
      partnerOnline: json['partnerOnline'] as bool?,
    );

Map<String, dynamic> _$UserConversationToJson(UserConversation instance) =>
    <String, dynamic>{
      'role': instance.role,
      'name': instance.name,
      'id': instance.id,
      'partnerOnline': instance.partnerOnline,
    };

UserConversations _$UserConversationsFromJson(Map<String, dynamic> json) =>
    UserConversations(
      (json['content'] as List<dynamic>?)
              ?.map((e) => UserConversation.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    )
      ..pageSize = json['pageSize'] as int?
      ..page = json['page'] as int?
      ..total = json['total'] as int?;

Map<String, dynamic> _$UserConversationsToJson(UserConversations instance) =>
    <String, dynamic>{
      'pageSize': instance.pageSize,
      'page': instance.page,
      'total': instance.total,
      'content': instance.content,
    };
