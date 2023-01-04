// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Conversation _$ConversationFromJson(Map<String, dynamic> json) => Conversation(
      role: json['role'] as String?,
      msgType: json['msgType'] as String?,
      lastMessage: json['lastMessage'] as String?,
      avatar: json['avatar'] as String?,
      type: json['type'] as String?,
      partnerOnline: json['partnerOnline'] as bool?,
      createBy: json['createBy'] as String?,
      current: json['current'] == null
          ? null
          : Current.fromJson(json['current'] as Map<String, dynamic>),
      msgContent: json['msgContent'] as String?,
      partner: json['partner'] as String?,
      modifiedDate: json['modifiedDate'] == null
          ? null
          : DateTime.parse(json['modifiedDate'] as String),
      name: json['name'] as String?,
      id: json['id'] as int?,
      config: _stringToTheme(json['config'] as String?),
      notice: json['notice'] as int?,
    );

Map<String, dynamic> _$ConversationToJson(Conversation instance) =>
    <String, dynamic>{
      'role': instance.role,
      'msgType': instance.msgType,
      'lastMessage': instance.lastMessage,
      'avatar': instance.avatar,
      'type': instance.type,
      'partnerOnline': instance.partnerOnline,
      'createBy': instance.createBy,
      'current': instance.current,
      'msgContent': instance.msgContent,
      'partner': instance.partner,
      'modifiedDate': instance.modifiedDate?.toIso8601String(),
      'name': instance.name,
      'id': instance.id,
      'config': instance.config,
      'notice': instance.notice,
    };

Conversations _$ConversationsFromJson(Map<String, dynamic> json) =>
    Conversations(
      (json['content'] as List<dynamic>?)
              ?.map((e) => Conversation.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    )
      ..pageSize = json['pageSize'] as int?
      ..page = json['page'] as int?
      ..total = json['total'] as int?;

Map<String, dynamic> _$ConversationsToJson(Conversations instance) =>
    <String, dynamic>{
      'pageSize': instance.pageSize,
      'page': instance.page,
      'total': instance.total,
      'content': instance.content,
    };
