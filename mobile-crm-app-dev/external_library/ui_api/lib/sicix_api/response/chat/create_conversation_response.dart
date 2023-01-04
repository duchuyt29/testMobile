import 'package:json_annotation/json_annotation.dart';

import '../../models/chat/conversation/conversation_created.dart';
import '../base_response.dart';

part 'create_conversation_response.g.dart';

@JsonSerializable()
class CreateConversationResponse extends BaseResponse {
  ConversationCreated? data;

  CreateConversationResponse({this.data}) : super(false);

  factory CreateConversationResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateConversationResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CreateConversationResponseToJson(this);
}
