// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_conversation_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateConversationRequest _$CreateConversationRequestFromJson(
        Map<String, dynamic> json) =>
    CreateConversationRequest(
      (json['involves'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(
            k, CreateConversationUser.fromJson(e as Map<String, dynamic>)),
      ),
      type: json['type'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$CreateConversationRequestToJson(
        CreateConversationRequest instance) =>
    <String, dynamic>{
      'type': instance.type,
      'involves': CreateConversationRequest._involvesToJson(instance.involves),
      'name': instance.name,
    };

CreateConversationUser _$CreateConversationUserFromJson(
        Map<String, dynamic> json) =>
    CreateConversationUser(
      json['name'] as String,
    );

Map<String, dynamic> _$CreateConversationUserToJson(
        CreateConversationUser instance) =>
    <String, dynamic>{
      'name': instance.name,
    };
