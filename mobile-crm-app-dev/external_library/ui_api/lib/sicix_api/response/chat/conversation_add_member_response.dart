import 'package:json_annotation/json_annotation.dart';

import '../../models/chat/conversation/conversation_add_member.dart';
import '../base_response.dart';

part 'conversation_add_member_response.g.dart';

@JsonSerializable()
class ConversationAddMemberResponse extends BaseResponse {
  ConversationAddMember? data;

  ConversationAddMemberResponse({this.data}) : super(false);

  factory ConversationAddMemberResponse.fromJson(Map<String, dynamic> json) =>
      _$ConversationAddMemberResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ConversationAddMemberResponseToJson(this);
}
