import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';

import '../models/attachment/attachment_item.dart';
import '../models/home/comment.dart';
import '../models/media_file/media_file.dart';

part 'comment_request.g.dart';

@JsonSerializable()
class CommentRequest {
  @JsonKey(name: 'id')
  final String id;
  @JsonKey(toJson: null, includeIfNull: false)
  final String? parentId;
  final String application;
  final String refType;
  final int refId;
  final String type;
  final String content;
  @JsonKey(toJson: null, includeIfNull: false)
  final List<MediaFile>? attachments;

  CommentRequest({
    required this.id,
    this.parentId,
    required this.application,
    required this.refType,
    required this.refId,
    required this.type,
    required this.content,
    this.attachments,
  });

  factory CommentRequest.fromJson(Map<String, dynamic> json) =>
      _$CommentRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CommentRequestToJson(this);

  factory CommentRequest.fromComment({
    required int postId,
    required String comment,
    Comment? commentReply,
    List<AttachmentItem>? attachments,
  }) {
    if (commentReply?.id != null) {
      final userComment =
          '@[${commentReply?.createBy?.fullName ?? ''}](${commentReply?.createBy?.id ?? ''})';
      comment = '$userComment $comment';
    }

    return CommentRequest(
      id: const Uuid().v4(),
      parentId: commentReply?.parentId ?? commentReply?.id,
      application: 'comm-service',
      refType: 'feed',
      refId: postId,
      type: 'comment',
      content: comment,
      attachments: attachments?.map((e) => e.getMediaFile()).toList(),
    );
  }

//   --data-raw '{
//     "id": "93d22ae9-8d0d-497a-a461-ab5929eb210e", // đây là uuid tự sinh từ client
//     "parentId": "93d22ae9-8d0d-497a-a461-ab5929eb210e", // đây là uuid của comment đang reply
//     "application": "comm-service",
//     "refType": "feed",
//     "refId": 1784201085087744, // id của bản tin
//     "type": "POST",
//     "content": "@[Tăng Thành Phương](0fc48eff-40fb-4361-b3f0-0f5fcb7f85b1) đâê @[Tăng Thành Phương](0fc48eff-40fb-4361-b3f0-0f5fcb7f85b1)",
//     "attachments": [{"id": "d1ea163ce4774758a6ffdd66478b379a", "name": "lo-go-la-gi.png"}] // file đính kèm sau
// }'
}
