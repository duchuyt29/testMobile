import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:sicix/data/app_data_global.dart';

import '../models/auth/user_conversation.dart';
import '../models/auth/user_info.dart';
import '../models/chat/conversation/conversation.dart';

part 'create_conversation_request.g.dart';

@JsonSerializable()
class CreateConversationRequest {
  String? type;
  @JsonKey(toJson: _involvesToJson)
  Map<String, CreateConversationUser> involves;
  String? name;

  CreateConversationRequest(this.involves, {this.type, this.name});

  factory CreateConversationRequest.addMember(List<UserInfo> users) {
    final involves = <String, CreateConversationUser>{};
    users.forEach((user) {
      involves[user.id ?? ''] = CreateConversationUser(user.getName());
    });
    return CreateConversationRequest(involves);
  }

  factory CreateConversationRequest.fromGroup(
      List<UserInfo> users, String groupName) {
    final involves = <String, CreateConversationUser>{
      AppDataGlobal.userConfig?.id ?? '':
          CreateConversationUser(AppDataGlobal.userConfig?.getName() ?? ''),
      // id!: CreateConversationUser(getName()),
    };
    users.forEach((user) {
      involves[user.id ?? ''] = CreateConversationUser(user.getName());
    });
    return CreateConversationRequest(
      involves,
      type: Conversation.TYPE_GROUP,
      name: groupName,
    );
  }

  factory CreateConversationRequest.fromPrivate(UserInfo user) {
    final involves = <String, CreateConversationUser>{
      AppDataGlobal.userConfig?.id ?? '':
          CreateConversationUser(AppDataGlobal.userConfig?.getName() ?? ''),
      user.id ?? '': CreateConversationUser(user.getName()),
    };
    return CreateConversationRequest(
      involves,
      type: Conversation.TYPE_PRIVATE,
    );
  }

  factory CreateConversationRequest.fromPrivateUser(
      String name, String userId) {
    final involves = <String, CreateConversationUser>{
      AppDataGlobal.userConfig?.id ?? '':
          CreateConversationUser(AppDataGlobal.userConfig?.getName() ?? ''),
      userId: CreateConversationUser(name),
    };
    return CreateConversationRequest(
      involves,
      type: Conversation.TYPE_PRIVATE,
    );
  }

  factory CreateConversationRequest.fromPrivateUserConversation(
      UserConversation userConversation) {
    final involves = <String, CreateConversationUser>{
      AppDataGlobal.userConfig?.id ?? '':
          CreateConversationUser(AppDataGlobal.userConfig?.getName() ?? ''),
      userConversation.id ?? '':
          CreateConversationUser(userConversation.name ?? ''),
    };
    return CreateConversationRequest(
      involves,
      type: Conversation.TYPE_PRIVATE,
    );
  }

  factory CreateConversationRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateConversationRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateConversationRequestToJson(this);

  static dynamic _involvesToJson(Map<String, CreateConversationUser> involves) {
    // return const JsonEncoder().convert(involves);
    return jsonDecode(jsonEncode(involves));
  }
}

@JsonSerializable()
class CreateConversationUser {
  String name;

  CreateConversationUser(this.name);

  factory CreateConversationUser.fromJson(Map<String, dynamic> json) =>
      _$CreateConversationUserFromJson(json);

  Map<String, dynamic> toJson() => _$CreateConversationUserToJson(this);
}

// {
//   "type": "GROUP",
//   "involves": {
//     "97ff47ba-2936-45df-a0c4-748c6f6996c0": {
//       "name": "Nguyễn Trung Hiếu"
//     },
//     "031afb8a-93e1-477b-8c0f-fa40fb5eff17": {
//       "name": "Trần Minh Hiếu"
//     },
//     "0ece3f61-ba16-4b0e-a773-ac11bf070ab4": {
//       "name": "Trịnh Minh Hiếu"
//     }
//   },
//   "name": "Tam Hiếu"
// }

// {
//   "type": "PRIVATE",
//   "involves": {
//     "97ff47ba-2936-45df-a0c4-748c6f6996c0": {
//       "name": "Nguyễn Trung Hiếu"
//     },
//   }
// }
