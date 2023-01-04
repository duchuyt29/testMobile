import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:sicix/shared/services/path_service.dart';

import '../../base_models.dart';
import '../../media_file/media_file.dart';

part 'message_attach_file.g.dart';

@JsonSerializable()
class MessageAttachFile {
  static const String ATTACH_MEDIA = 'MEDIA';
  static const String ATTACH_FILE = 'FILE';

  @JsonKey(name: 'create_by')
  String? createBy;
  // dynamic reaction;
  // dynamic quote;
  String? content;
  String? id;
  @JsonKey(name: 'modified_date')
  String? modifiedDate;

  MessageAttachFile({
    this.createBy,
    // this.reaction,
    // this.quote,
    this.content,
    this.id,
    this.modifiedDate,
  });

  factory MessageAttachFile.fromJson(Map<String, dynamic> json) {
    return _$MessageAttachFileFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MessageAttachFileToJson(this);

  List<MediaFile> getContents() {
    try {
      return (json.decode(content ?? '') as List<dynamic>?)
              ?.map((e) => MediaFile.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [];
    } catch (e) {
      debugPrint('[MessageAttachFile] $ATTACH_MEDIA');
      return [];
    }
  }
}

@JsonSerializable()
class MessageAttachFiles extends BaseModels {
  @JsonKey(defaultValue: [])
  List<MessageAttachFile> content;

  MessageAttachFiles(this.content);

  factory MessageAttachFiles.fromJson(Map<String, dynamic> json) {
    return _$MessageAttachFilesFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() => _$MessageAttachFilesToJson(this);
}
