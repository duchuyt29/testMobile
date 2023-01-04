import 'dart:convert';

import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:get/get.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:sicix/shared/services/path_service.dart';
import 'package:sicix/shared/utils/app_util.dart';
import 'package:sicix/shared/utils/date_util.dart';

import '../../../request/request_message_ws.dart';
import '../../common/reaction_model.dart';
import '../../media_file/media_file.dart';
import '../message_content/message_content_event.dart';

part 'message_item.g.dart';

@JsonSerializable()
class MessageItem {
  static const ID = 'ID';
  static const TYPE = 'TYPE';
  static const REACTION = 'REACTION';
  static const REPLY = 'REPLY';
  static const FORWARD = 'FORWARD';
  static const IS_EDIT = 'IS_EDIT';

  String? type;
  @JsonKey(name: 'create_by')
  String? createBy;
  String? edit;
  dynamic meta;
  String? id;
  @JsonKey(name: 'create_date', fromJson: _stringToDate)
  DateTime? createDate;
  // @JsonKey(ignore: true)
  // String? createDateString;

  // @JsonKey(fromJson: _contentFromJson)
  @JsonKey(ignore: true)
  String content = '';
  @JsonKey(ignore: true)
  ReactionModel? reaction;
  @JsonKey(ignore: true)
  MessageItem? quote;
  @JsonKey(ignore: true)
  MessageItem? forward;

  @JsonKey(ignore: true)
  List<MediaFile> attachMedias = [];
  @JsonKey(ignore: true)
  List<MediaFile> attachFiles = [];

  @JsonKey(ignore: true)
  late ChatUser user;

  @JsonKey(ignore: true)
  MessageContentEvent? event;
  @JsonKey(ignore: true)
  List<String> participants = [];
  @JsonKey(ignore: true)
  List<ChatUser> participantChatUsers = [];

  MessageItem({
    this.type,
    this.createBy,
    this.reaction,
    this.quote,
    this.edit,
    this.meta,
    this.id,
    this.createDate,
  });

  factory MessageItem.fromJson(Map<String, dynamic> json) {
    final messageItem = _$MessageItemFromJson(json);
    messageItem.loadContent(json);
    return messageItem;
  }
  // _$MessageItemFromJson(json).._loadContent(json);

  Map<String, dynamic> toJson() => _$MessageItemToJson(this);

  String getSumaryContent() {
    switch (type) {
      case MessageContentEvent.TYPE_MEDIA:
        return 'messenger.image'.tr;
      case MessageContentEvent.TYPE_FILE:
        return 'messenger.file'.tr;
      default:
        return content;
    }
  }

  ChatMessage getChatMessage() {
    // var medias = <ChatMedia>[];
    // switch (type) {
    //   case MessageContent.TYPE_FORWARD:
    //     medias = forward?.getChatMedia() ?? [];
    //     break;
    //   default:
    //     medias = getChatMedia();
    //     break;
    // }
    if (forward != null) {
      return ChatMessage(
        user: forward!.user,
        createdAt: createDate?.toLocal() ?? DateTime.now(),
        text: forward!.content,
        medias: forward!.getChatMedia(),
        status: MessageStatus.received,
        customProperties: {
          ID: id,
          TYPE: type,
          REACTION: reaction,
          REPLY: quote,
          FORWARD: forward,
          IS_EDIT: edit != null,
        },
      );
    }
    return ChatMessage(
      user: user,
      createdAt: createDate?.toLocal() ?? DateTime.now(),
      text: event != null
          ? event!.getDescription(
              createChatUser: user, participantUsers: participantChatUsers)
          : content,
      medias: getChatMedia(),
      customProperties: {
        ID: id,
        TYPE: type,
        REACTION: reaction,
        REPLY: quote,
        FORWARD: forward,
        IS_EDIT: edit != null,
      },
    );
  }

  RequestMessageWS getQuoteMessageWS(int? conversationId) {
    switch (type) {
      case MessageContentEvent.TYPE_MEDIA:
        return RequestMessageWS(
          id: id,
          convId: conversationId,
          createBy: createBy,
          createDate: createDate,
          type: MessageContentEvent.TYPE_MEDIA,
          content: attachMedias,
        );
      case MessageContentEvent.TYPE_FILE:
        return RequestMessageWS(
          id: id,
          convId: conversationId,
          createBy: createBy,
          createDate: createDate,
          type: MessageContentEvent.TYPE_FILE,
          content: attachMedias,
        );
      default:
        return RequestMessageWS(
          id: id,
          convId: conversationId,
          createBy: createBy,
          createDate: createDate,
          content: content,
          preparedContent: [
            PreparedContent(content),
          ],
          prepared: true,
          type: MessageContentEvent.TYPE_CHAT,
          quoteCreateDate: DateUtil.formatDatetimeToString(
            DateTime.now(),
            type: DateUtil.DATETIME_TYPE,
          ),
        );
    }
  }

  bool isMedia() {
    return [MessageContentEvent.TYPE_MEDIA, MessageContentEvent.TYPE_FILE]
        .contains(type);
  }

  List<ChatMedia> getChatMedia() {
    switch (type) {
      case MessageContentEvent.TYPE_MEDIA:
        return attachMedias.map((e) {
          return ChatMedia(
            url: e.getMediaFilePath(),
            fileName: e.name ?? e.id ?? '',
            type: e.isVideo() ? MediaType.video : MediaType.image,
          );
        }).toList();
      case MessageContentEvent.TYPE_FILE:
        return attachFiles.map((e) {
          if (e.isImage()) {
            return ChatMedia(
              url: e.getMediaFilePath(),
              fileName: e.name ?? e.id ?? '',
              type: MediaType.image,
            );
          } else {
            return ChatMedia(
              url: PathService.file(e.id),
              fileName: e.name ?? e.id ?? '',
              type: MediaType.file,
            );
          }
        }).toList();
      default:
        return [];
    }
  }

  MediaFile? firstMediaFile() {
    switch (type) {
      case MessageContentEvent.TYPE_MEDIA:
        return attachMedias.isEmpty ? null : attachMedias.first;
      case MessageContentEvent.TYPE_FILE:
        return attachFiles.isEmpty ? null : attachFiles.first;
      default:
        return null;
    }
  }

  void loadContent(Map<String, dynamic> json) {
    user = ChatUser(id: createBy ?? '');
    // createDateString = json['create_date'] as String?;
    if (createDate == null && json['createDate'] != null) {
      createDate = _stringToDate(json['createDate']);
    }

    if (json['createBy'] != null) {
      createBy = json['createBy'];
    }

    if (json['reaction'] != null) {
      if (json['reaction'] is String) {
        reaction = ReactionModel.fromJson(jsonDecode(json['reaction']));
      } else if (json['reaction'] is Map<String, dynamic>) {
        reaction = ReactionModel.fromJson(json['reaction']);
      } else {
        printError(info: 'not format reaction ${json['reaction']}');
      }
    }

    if (json['quote'] != null) {
      if (json['quote'] is String) {
        quote = MessageItem.fromJson(jsonDecode(json['quote']));
      } else if (json['quote'] is Map<String, dynamic>) {
        quote = MessageItem.fromJson(json['quote']);
      } else {
        printError(info: 'not format quote ${json['quote']}');
      }
      printInfo(info: quote?.toJson().toString() ?? '');
    }

    switch (type) {
      case MessageContentEvent.TYPE_FORWARD:
        try {
          if (json['content'] is String) {
            forward = MessageItem.fromJson(jsonDecode(json['content']));
          } else if (json['content'] is Map<String, dynamic>) {
            forward = MessageItem.fromJson(json['content']);
          } else {
            printError(info: 'not format forward content ${json['content']}');
          }
        } catch (e) {
          printError(info: 'convert TYPE_FORWARD error ${e.toString()}');
        }
        printInfo(info: 'convert TYPE_FORWARD ${forward?.toJson().toString()}');
        break;
      case MessageContentEvent.TYPE_EVENT:
        try {
          if (json['content'] is String) {
            event = MessageContentEvent.fromJson(jsonDecode(json['content']));
          } else if (json['content'] is Map<String, dynamic>) {
            event = MessageContentEvent.fromJson(json['content']);
          } else {
            printError(info: 'not format event content ${json['content']}');
          }
          participants = event?.participant ?? [];
          content = event?.getDescription() ?? '';
          break;
        } catch (e) {
          printError(info: 'convert TYPE_EVENT error ${e.toString()}');
        }
        // return content ?? '';
        break;
      case MessageContentEvent.TYPE_MEDIA:
        attachMedias = _loadMetadataFromContent(json['content']);
        break;
      case MessageContentEvent.TYPE_FILE:
        attachFiles = _loadMetadataFromContent(json['content']);
        break;
      case MessageContentEvent.TYPE_TEXT:
      default:
        content = AppUtil.formatEmojiMessageContent(json['content'] ?? '');
        break;
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
}

DateTime? _stringToDate(dynamic value) {
  try {
    if (value == null) {
      return null;
    } else if (value is int) {
      return DateTime.fromMicrosecondsSinceEpoch(value * 1000);
    } else {
      return DateTime.parse(value as String);
    }
  } catch (e) {
    return null;
  }
}
