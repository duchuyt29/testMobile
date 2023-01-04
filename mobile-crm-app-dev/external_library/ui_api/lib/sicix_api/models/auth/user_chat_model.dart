import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:sicix/shared/services/path_service.dart';

part 'user_chat_model.g.dart';

@JsonSerializable()
class UserChatModel {
  String? id;
  int? companyId;
  String? username;
  String? fullName;
  String? locale;
  String? avatar;
  int? status;
  dynamic dataScope;

  @JsonKey(ignore: true)
  String? ruleInConversation;

  UserChatModel({
    this.id,
    this.companyId,
    this.username,
    this.fullName,
    this.locale,
    this.avatar,
    this.status,
    this.dataScope,
  });

  factory UserChatModel.fromJson(Map<String, dynamic> json) {
    return _$UserChatModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UserChatModelToJson(this);

  String getAvatar() {
    return PathService.imagePath(avatar);
  }

  ChatUser getChatUser({String? userId}) {
    return ChatUser(
        id: id ?? userId ?? '', profileImage: getAvatar(), firstName: fullName);
  }
}
