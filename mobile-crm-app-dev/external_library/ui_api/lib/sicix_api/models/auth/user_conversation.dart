import 'package:get/get.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:sicix/shared/services/path_service.dart';

import '../base_models.dart';
import '../chat/conversation/conversation.dart';
import 'user_chat_model.dart';

part 'user_conversation.g.dart';

@JsonSerializable()
class UserConversation {
  String? role;
  String? name;
  String? id;
  bool? partnerOnline;

  @JsonKey(ignore: true)
  UserChatModel? userInfo;

  UserConversation({this.role, this.name, this.id, this.partnerOnline});

  factory UserConversation.fromJson(Map<String, dynamic> json) {
    return _$UserConversationFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UserConversationToJson(this);

  String getAvatar() {
    return PathService.imagePath(userInfo?.avatar);
  }

  String getName() {
    return userInfo?.fullName ?? name ?? '';
  }

  String getRule() {
    return isAdmin()
        ? 'member.conversation.admin'.tr
        : 'member.conversation.member'.tr;
  }

  bool isAdmin() {
    return role == Conversation.ROLE_ADMIN;
  }
}

@JsonSerializable()
class UserConversations extends BaseModels {
  @JsonKey(defaultValue: [])
  List<UserConversation> content;

  UserConversations(this.content);

  factory UserConversations.fromJson(Map<String, dynamic> json) {
    return _$UserConversationsFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() => _$UserConversationsToJson(this);
}
