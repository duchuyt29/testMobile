import 'package:get/utils.dart';
import 'package:json_annotation/json_annotation.dart';

import '../chat/message_content/message_content_event.dart';
import '../media_file/media_file.dart';
import 'attachment_file_item.dart';

part 'attachment_item.g.dart';

@JsonSerializable()
class AttachmentItem {
  int? id;
  String? name;
  String? application;
  dynamic description;
  dynamic versionNo;
  int? changes;
  String? refType;
  String? refId;
  dynamic businessRole;
  dynamic attributes;
  AttachmentFileItem? file;

  AttachmentItem({
    this.id,
    this.name,
    this.application,
    this.description,
    this.versionNo,
    this.changes,
    this.refType,
    this.refId,
    this.businessRole,
    this.attributes,
    this.file,
  });

  factory AttachmentItem.fromJson(Map<String, dynamic> json) {
    return _$AttachmentItemFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AttachmentItemToJson(this);

  MediaFile getMediaFile() {
    final mediaFile = MediaFile(
      id: file?.id,
      ref: file?.ref,
      name: file?.name,
      contentType: file?.contentType,
    );
    return mediaFile;
  }

  String getMediaType() {
    if (GetUtils.isImage(file?.name ?? name ?? '')) {
      return MessageContentEvent.TYPE_MEDIA;
    }
    return ((file?.contentType?.contains('video') ?? false) ||
            (file?.contentType?.contains('image') ?? false))
        ? MessageContentEvent.TYPE_MEDIA
        : MessageContentEvent.TYPE_FILE;
  }
}
