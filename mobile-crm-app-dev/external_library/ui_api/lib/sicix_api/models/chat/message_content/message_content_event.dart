import 'dart:convert';

import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:get/get.dart';
import 'package:json_annotation/json_annotation.dart';

part 'message_content_event.g.dart';

@JsonSerializable()
class MessageContentEvent {
  static const String TYPE_TEXT = 'TEXT';
  static const String TYPE_MEDIA = 'MEDIA';
  static const String TYPE_FILE = 'FILE';
  static const String TYPE_FORWARD = 'FORWARD';
  static const String TYPE_DELETE = 'DELETE';
  static const String TYPE_EVENT = 'EVENT';
  static const String TYPE_CHAT = 'CHAT';
  static const String TYPE_EVENT_PIN = 'PIN';
  static const String TYPE_EVENT_CONFIG = 'CONFIG';
  static const String TYPE_EVENT_RENAME = 'RENAME';
  static const String TYPE_EVENT_AVATAR = 'AVATAR';
  static const String TYPE_EVENT_CREATE = 'CREATE';
  static const String TYPE_EVENT_REMOVE = 'REMOVE';
  static const String TYPE_EVENT_ADD = 'ADD';
  static const String TYPE_EVENT_LEAVE = 'LEAVE';
  static const String TYPE_EVENT_GRANT = 'GRANT';
  static const String TYPE_EVENT_REVOKE = 'REVOKE';

  String? type;
  String? createBy;

  // Với event đổi tên
  String? name;

  // Với event cuộc thoại
  List<String>? participant;

  // Với event pin tin nhắn
  @JsonKey(name: 'pin_id')
  int? pinId;
  String? id;
  String? content;
  String? msgType;
  @JsonKey(name: 'create_date')
  int? createDate;

  MessageContentEvent({this.name, this.type, this.createBy, this.participant});

  factory MessageContentEvent.fromJson(Map<String, dynamic> json) {
    return _$MessageContentEventFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MessageContentEventToJson(this);

  String getTitle() {
    switch (type?.toUpperCase()) {
      case MessageContentEvent.TYPE_EVENT_ADD:
        return 'messenger.add'.tr;
      case MessageContentEvent.TYPE_EVENT_CREATE:
        return 'messenger.create'.tr;
      case MessageContentEvent.TYPE_EVENT_REMOVE:
        return 'messenger.remove.user'.tr;
      case MessageContentEvent.TYPE_EVENT_LEAVE:
        return 'messenger.leave'.tr;
      case MessageContentEvent.TYPE_EVENT_GRANT:
        return 'messenger.grant'.tr;
      case MessageContentEvent.TYPE_EVENT_REVOKE:
        return 'messenger.revoke'.tr;
      case MessageContentEvent.TYPE_EVENT_PIN:
        return 'messenger.pin'.tr;
      default:
        return type ?? '';
    }
  }

  String getDescription(
      {ChatUser? createChatUser, List<ChatUser>? participantUsers}) {
    switch (type?.toUpperCase()) {
      case MessageContentEvent.TYPE_EVENT_CREATE:
        if (createChatUser != null && participantUsers != null) {
          if (participantUsers.isEmpty) {
            return 'messenger.create.empty'.trArgs([
              createChatUser.getFullName(),
            ]);
          } else {
            return 'messenger.create.content'.trArgs([
              createChatUser.getFullName(),
              participantUsers.map((e) => e.getFullName()).join(', ')
            ]);
          }
        }
        return 'messenger.create'.tr;
      case MessageContentEvent.TYPE_EVENT_ADD:
        if (createChatUser != null && participantUsers != null) {
          return 'messenger.add.content'.trArgs([
            createChatUser.getFullName(),
            participantUsers.map((e) => e.getFullName()).join(', ')
          ]);
        }
        return 'messenger.add'.tr;
      case MessageContentEvent.TYPE_EVENT_REMOVE:
        if (createChatUser != null && participantUsers != null) {
          return 'messenger.remove.user.content'.trArgs([
            createChatUser.getFullName(),
            participantUsers.map((e) => e.getFullName()).join(', ')
          ]);
        }
        return 'messenger.remove.user'.tr;
      case MessageContentEvent.TYPE_EVENT_RENAME:
        if (createChatUser != null) {
          return 'messenger.rename.content'
              .trArgs([createChatUser.getFullName(), name ?? '']);
        }
        return 'messenger.rename'.tr;
      case MessageContentEvent.TYPE_EVENT_AVATAR:
        if (createChatUser != null) {
          return 'messenger.avatar.content'
              .trArgs([createChatUser.getFullName()]);
        }
        return 'messenger.avatar'.tr;
      case MessageContentEvent.TYPE_EVENT_CONFIG:
        if (createChatUser != null) {
          return 'messenger.theme.content'
              .trArgs([createChatUser.getFullName()]);
        }
        return 'messenger.theme'.tr;
      case MessageContentEvent.TYPE_EVENT_LEAVE:
        if (createChatUser != null) {
          return 'messenger.leave.content'
              .trArgs([createChatUser.getFullName()]);
        }
        return 'messenger.leave'.tr;
      case MessageContentEvent.TYPE_EVENT_GRANT:
        if (createChatUser != null && participantUsers != null) {
          return 'messenger.grant.content'.trArgs([
            createChatUser.getFullName(),
            participantUsers.map((e) => e.getFullName()).join(', ')
          ]);
        }
        return 'messenger.grant'.tr;
      case MessageContentEvent.TYPE_EVENT_REVOKE:
        if (createChatUser != null && participantUsers != null) {
          return 'messenger.revoke.content'.trArgs([
            createChatUser.getFullName(),
            participantUsers.map((e) => e.getFullName()).join(', ')
          ]);
        }
        return 'messenger.revoke'.tr;
      case MessageContentEvent.TYPE_EVENT_PIN:
        switch (msgType) {
          case MessageContentEvent.TYPE_MEDIA:
            try {
              final count =
                  (json.decode(content ?? '') as List<dynamic>?)?.length ?? 0;
              return 'messenger.pin.image'.trArgs([count.toString()]);
            } catch (e) {
              Get.log(
                  '[MessageItem] count MessageContent.TYPE_MEDIA error ${e.toString()}');
            }
            return '';
          case MessageContentEvent.TYPE_FILE:
            try {
              final count =
                  (json.decode(content ?? '') as List<dynamic>?)?.length ?? 0;
              return 'messenger.pin.file'.trArgs([count.toString()]);
            } catch (e) {
              Get.log(
                  '[MessageItem] count MessageContent.TYPE_FILE error ${e.toString()}');
            }
            return '';
          default:
            return 'messenger.pin.text'.trArgs([content ?? '']);
        }
      default:
        return type ?? '';
    }
  }
}
