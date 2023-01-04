import 'package:collection/collection.dart';
import 'package:get/get.dart';
import 'package:html/parser.dart' show parse;
import 'package:json_annotation/json_annotation.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../attachment/attachment_item.dart';
import '../workgroup/workgroup.dart';
import 'task.dart';

part 'post_content.g.dart';

@JsonSerializable()
class PostContent {
  final Task? task;

  @JsonKey(ignore: true)
  Workgroup? workgroup;

  @JsonKey(ignore: true)
  bool showKeyboardComment = false;

  @JsonKey(ignore: true)
  List<AttachmentItem> attachmentItems = [];

  PostContent({this.task});

  factory PostContent.fromJson(Map<String, dynamic> json) =>
      _$PostContentFromJson(json);

  Map<String, dynamic> toJson() => _$PostContentToJson(this);

  String getUserAvatar() {
    if (workgroup?.attributes?.post?.avatar?.isNotEmpty ?? false) {
      return workgroup!.attributes!.post!.getAvatar();
    }
    return task?.createBy?.getAvatar() ?? '';
  }

  String getUserName() {
    if (workgroup?.attributes?.post?.delegate?.isNotEmpty ?? false) {
      return workgroup!.attributes!.post!.delegate!;
    }
    return task?.createBy?.fullName ?? '';
  }

  String getEventTitle() {
    final fullname = getUserName();
    final publishDate = getTime();
    if (publishDate.isEmpty) {
      return fullname;
    } else if (fullname.isEmpty) {
      return publishDate;
    } else {
      return '$fullname - $publishDate';
    }
  }

  String getTime() {
    if (task?.publishDate != null) {
      // timeago.setLocaleMessages('', CustomTimeagoMessages());
      return timeago.format(task!.publishDate!, locale: 'locale'.tr);
    }
    return '';
  }

  String getBackgroundImage() {
    final document = parse(task?.description ?? '');
    final link = document.querySelector('img');
    return link?.attributes['src'] ?? '';
  }

  String getAttachment() {
    final attachment = attachmentItems
        .firstWhereOrNull((attachment) => attachment.getMediaFile().isImage());
    if (attachment == null) {
      return '';
    }
    return attachment.getMediaFile().getMediaFilePath();
  }

  String getTotelVote() => (task?.getTotelVote() ?? 0).toString();

  bool isPollDone() {
    return task?.polls
            ?.any((poll) => poll.deadline?.isBefore(DateTime.now()) ?? false) ??
        false;
  }

  String getDeadline() {
    for (final poll in task?.polls ?? []) {
      final deadline = poll.getDeadline();
      if (deadline.isNotEmpty) {
        return deadline;
      }
    }
    return '';
  }
}
