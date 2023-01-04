import 'dart:convert';

import 'package:get/utils.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:sicix/shared/utils/app_util.dart';

import '../../base_models.dart';
import '../../media_file/media_file.dart';
import '../message_content/message_content_event.dart';

part 'message_pin.g.dart';

@JsonSerializable()
class MessagePin {
  static const String MESSAGE_PIN_GROUP = 'group';
  static const String MESSAGE_PIN_PRIVATE = 'owner';

  @JsonKey(name: 'pin_id')
  int? pinId;
  String? id;
  @JsonKey(name: 'create_by')
  String? createBy;
  String? type;
  dynamic meta;
  String? content;
  @JsonKey(name: 'pin_date')
  String? pinDate;
  @JsonKey(name: 'create_date')
  String? createDate;

  @JsonKey(ignore: true)
  List<MediaFile> mediaFiles = [];

  MessagePin({
    this.pinId,
    this.id,
    this.createBy,
    this.type,
    this.meta,
    this.content,
    this.pinDate,
    this.createDate,
  });

  factory MessagePin.fromJson(Map<String, dynamic> json) {
    final messagePin = _$MessagePinFromJson(json);
    try {
      if (json['content'] is String) {
        return messagePin;
      }
      messagePin.mediaFiles =
          (jsonDecode(json['content'] ?? '') as List<dynamic>?)
                  ?.map((e) => MediaFile.fromJson(e as Map<String, dynamic>))
                  .toList() ??
              [];
    } catch (e) {
      print('convert TYPE_MEDIA error ${e.toString()}');
    }
    return messagePin;
  }

  Map<String, dynamic> toJson() => _$MessagePinToJson(this);

  String getPinContent() {
    //   switch (type) {
    //     case MessageContentEvent.TYPE_MEDIA:
    //       return '';
    //     case MessageContentEvent.TYPE_FILE:
    //       return '';
    //     case MessageContentEvent.TYPE_FORWARD:
    //       try {
    //         final messageContent =
    //             MessageContentEvent.fromJson(json.decode(content ?? ''));
    //         return messageContent.content ?? '';
    //       } catch (e) {
    //         printError(info: 'convert TYPE_FORWARD error ${e.toString()}');
    //       }
    //       return content ?? '';
    //     case MessageContentEvent.TYPE_EVENT:
    //       try {
    //         final messageContent =
    //             MessageContentEvent.fromJson(json.decode(content ?? ''));
    //         return messageContent.getDescription();
    //       } catch (e) {
    //         printError(info: 'convert TYPE_EVENT error ${e.toString()}');
    //       }
    //       return content ?? '';
    //     case MessageContentEvent.TYPE_TEXT:
    //     default:
    //       return AppCommon.formatEmojiMessageContent(content ?? '');
    //   }
    // }

    switch (type) {
      case MessageContentEvent.TYPE_MEDIA:
      case MessageContentEvent.TYPE_FILE:
        return 'messenger.pin.file'
            .trArgs([mediaFiles.isEmpty ? '' : mediaFiles.length.toString()]);
      case MessageContentEvent.TYPE_EVENT:
        try {
          final messageContent =
              MessageContentEvent.fromJson(json.decode(content ?? ''));
          return messageContent.getDescription();
        } catch (e) {
          printError(info: 'convert TYPE_EVENT error ${e.toString()}');
        }
        return content ?? '';
      case MessageContentEvent.TYPE_TEXT:
      default:
        return AppUtil.formatEmojiMessageContent(content ?? '');
    }
  }
}

@JsonSerializable()
class MessagePins extends BaseModels {
  @JsonKey(defaultValue: [])
  List<MessagePin> content;

  MessagePins(this.content);

  factory MessagePins.fromJson(Map<String, dynamic> json) {
    return _$MessagePinsFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() => _$MessagePinsToJson(this);
}
