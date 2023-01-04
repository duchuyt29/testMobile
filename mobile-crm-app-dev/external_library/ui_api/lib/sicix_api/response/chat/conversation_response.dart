import 'package:json_annotation/json_annotation.dart';

import '../../models/chat/conversation/conversation.dart';
import '../base_response.dart';

part 'conversation_response.g.dart';

@JsonSerializable()
class ConversationResponse extends BaseResponse {
  Conversations? data;

  ConversationResponse({this.data}) : super(false);

  factory ConversationResponse.fromJson(Map<String, dynamic> json) =>
      _$ConversationResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ConversationResponseToJson(this);
}
