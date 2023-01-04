import 'package:json_annotation/json_annotation.dart';

part 'conversation_add_member.g.dart';

@JsonSerializable()
class ConversationAddMember {
  List<String>? participant;
  List<String>? newParticipant;

  ConversationAddMember({this.participant, this.newParticipant});

  factory ConversationAddMember.fromJson(Map<String, dynamic> json) {
    return _$ConversationAddMemberFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ConversationAddMemberToJson(this);
}
