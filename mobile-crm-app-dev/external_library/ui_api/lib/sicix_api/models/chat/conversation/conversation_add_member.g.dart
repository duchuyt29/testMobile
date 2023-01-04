// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation_add_member.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConversationAddMember _$ConversationAddMemberFromJson(
        Map<String, dynamic> json) =>
    ConversationAddMember(
      participant: (json['participant'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      newParticipant: (json['newParticipant'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$ConversationAddMemberToJson(
        ConversationAddMember instance) =>
    <String, dynamic>{
      'participant': instance.participant,
      'newParticipant': instance.newParticipant,
    };
