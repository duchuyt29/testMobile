import 'dart:convert';

import 'package:get/get.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:sicix/shared/services/path_service.dart';
import 'package:sicix/shared/utils/app_util.dart';
import 'package:sicix/shared/utils/date_util.dart';

import '../../auth/user_info.dart';
import '../../base_models.dart';
import '../../media_file/media_file.dart';
import '../message_content/message_content_event.dart';
import 'conversation_theme.dart';
import 'current.dart';

part 'conversation.g.dart';

@JsonSerializable()
class Conversation {
  static const String TYPE_GROUP = 'GROUP';
  static const String TYPE_PRIVATE = 'PRIVATE';

  static const String ROLE_MEMBER = 'MEMBER';
  static const String ROLE_ADMIN = 'ADMIN';

  String? role;
  String? msgType;
  String? lastMessage;
  String? avatar;
  String? type;
  bool? partnerOnline;
  String? createBy;
  Current? current;
  String? msgContent;
  String? partner;
  DateTime? modifiedDate;
  String? name;
  int? id;
  @JsonKey(fromJson: _stringToTheme)
  ConversationTheme? config;
  int? notice;

  @JsonKey(ignore: true)
  int memberCount = 0;

  @JsonKey(ignore: true)
  UserInfo? userInfo;

  @JsonKey(ignore: true)
  List<MediaFile> attachMedias = [];
  @JsonKey(ignore: true)
  List<MediaFile> attachFiles = [];

  Conversation({
    this.role,
    this.msgType,
    this.lastMessage,
    this.avatar,
    this.type,
    this.partnerOnline,
    this.createBy,
    this.current,
    this.msgContent,
    this.partner,
    this.modifiedDate,
    this.name,
    this.id,
    this.config,
    this.notice,
  });

  factory Conversation.fromJson(Map<String, dynamic> json) {
    final conversation = _$ConversationFromJson(json);
    conversation.loadContent(json);
    return conversation;
  }

  Map<String, dynamic> toJson() => _$ConversationToJson(this);

  Conversation copyWith({
    String? role,
    String? msgType,
    String? lastMessage,
    String? avatar,
    String? type,
    bool? partnerOnline,
    String? createBy,
    Current? current,
    String? msgContent,
    String? partner,
    DateTime? modifiedDate,
    String? name,
    int? id,
    ConversationTheme? config,
    int? notice,
    int? memberCount,
  }) {
    return Conversation(
      role: role ?? this.role,
      msgType: msgType ?? this.msgType,
      lastMessage: lastMessage ?? this.lastMessage,
      avatar: avatar ?? this.avatar,
      type: type ?? this.type,
      partnerOnline: partnerOnline ?? this.partnerOnline,
      createBy: createBy ?? this.createBy,
      current: current ?? this.current,
      msgContent: msgContent ?? this.msgContent,
      partner: partner ?? this.partner,
      modifiedDate: modifiedDate ?? this.modifiedDate,
      name: name ?? this.name,
      id: id ?? this.id,
      config: config ?? this.config,
      notice: notice ?? this.notice,
    )..memberCount = memberCount ?? this.memberCount;
  }

  void loadContent(Map<String, dynamic> json) {
    switch (msgType) {
      case MessageContentEvent.TYPE_MEDIA:
        attachMedias = _loadMetadataFromContent(json['msgContent']);
        break;
      case MessageContentEvent.TYPE_FILE:
        attachFiles = _loadMetadataFromContent(json['msgContent']);
        break;
      default:
        break;
    }
  }

  void updateFromMessageWS(Map<String, dynamic> message, bool isUpdateUnread) {
    if (isUpdateUnread) {
      current?.unread = (current?.unread ?? 0) + 1;
    }
    current?.lastMessage = message['id'];
    msgType = message['type'];
    msgContent =
        message['content'] != null ? message['content'].toString() : '';
    createBy = message['createBy'] ?? '';
    modifiedDate = DateTime.now();
  }

  bool isBadge() {
    return (current?.unread ?? 0) > 0;
  }

  String getMessageContent() {
    switch (msgType) {
      case MessageContentEvent.TYPE_MEDIA:
        if (attachMedias.isEmpty) {
          return 'messenger.media'.tr;
        } else if (attachMedias.first.isVideo()) {
          return 'messenger.video'.tr;
        } else {
          return 'messenger.image'.tr;
        }
      case MessageContentEvent.TYPE_FILE:
        return 'messenger.file'.tr;
      case MessageContentEvent.TYPE_FORWARD:
        return 'chat.forward'.tr;
      case MessageContentEvent.TYPE_EVENT:
        try {
          final messageContent =
              MessageContentEvent.fromJson(json.decode(msgContent ?? ''));
          return messageContent.getTitle();
        } catch (e) {
          printError(info: 'convert TYPE_EVENT error ${e.toString()}');
          return msgContent ?? '';
        }
      case MessageContentEvent.TYPE_TEXT:
      default:
        return AppUtil.formatEmojiMessageContent(msgContent ?? '');
    }
  }

  List<MediaFile> _loadMetadataFromContent(dynamic content) {
    var attachs = <MediaFile>[];
    try {
      if (content is String) {
        attachs = (jsonDecode(content) as List<dynamic>?)
                ?.map((e) => MediaFile.fromJson(e as Map<String, dynamic>))
                .toList() ??
            [];
      } else if (content is List) {
        attachs = content.map((e) => MediaFile.fromJson(e)).toList();
      } else {
        printError(info: 'not format attach content $content');
      }
    } catch (e) {
      printError(info: 'convert ATTACH error ${e.toString()}');
    }
    return attachs.where((element) => element.id != null).toList();
  }

  String getTime() {
    if (modifiedDate == null) {
      return '';
    }
    final hours = DateTime.now().difference(modifiedDate!).inHours;
    if (hours < 24) {
      return DateUtil.formatDatetimeToString(modifiedDate,
          type: DateUtil.TIME_TYPE);
    } else {
      return DateUtil.formatDatetimeToString(modifiedDate);
    }
  }

  String getConversationName() {
    return name ?? '';
  }

  String getName() {
    final fullname = userInfo?.getName() ?? '';
    return fullname.isNotEmpty ? fullname : (name ?? '');
  }

  String getAvatar() {
    final avatarPath = userInfo?.getAvatar() ?? '';
    return avatarPath.isNotEmpty ? avatarPath : PathService.imagePath(avatar);
  }

  bool isAdmin() {
    return role == ROLE_ADMIN;
  }

  bool isPrivateChat() {
    return type == Conversation.TYPE_PRIVATE;
  }
}

@JsonSerializable()
class Conversations extends BaseModels {
  @JsonKey(defaultValue: [])
  List<Conversation> content;

  Conversations(this.content);

  factory Conversations.fromJson(Map<String, dynamic> json) {
    return _$ConversationsFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() => _$ConversationsToJson(this);
}

ConversationTheme? _stringToTheme(String? config) {
  try {
    final theme = ConversationTheme.fromJson(json.decode(config ?? ''));
    return theme;
  } catch (e) {
    return null;
  }
}
