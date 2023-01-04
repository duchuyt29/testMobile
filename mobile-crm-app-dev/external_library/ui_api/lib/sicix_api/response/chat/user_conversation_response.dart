import 'package:json_annotation/json_annotation.dart';

import '../../models/auth/user_conversation.dart';
import '../base_response.dart';

part 'user_conversation_response.g.dart';

@JsonSerializable()
class UserConversationResponse extends BaseResponse {
  UserConversations? data;

  UserConversationResponse({this.data}) : super(false);

  factory UserConversationResponse.fromJson(Map<String, dynamic> json) =>
      _$UserConversationResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$UserConversationResponseToJson(this);
}
