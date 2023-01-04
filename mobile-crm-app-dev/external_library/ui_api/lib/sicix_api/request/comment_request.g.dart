// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentRequest _$CommentRequestFromJson(Map<String, dynamic> json) =>
    CommentRequest(
      id: json['id'] as String,
      parentId: json['parentId'] as String?,
      application: json['application'] as String,
      refType: json['refType'] as String,
      refId: json['refId'] as int,
      type: json['type'] as String,
      content: json['content'] as String,
      attachments: (json['attachments'] as List<dynamic>?)
          ?.map((e) => MediaFile.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CommentRequestToJson(CommentRequest instance) {
  final val = <String, dynamic>{
    'id': instance.id,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('parentId', instance.parentId);
  val['application'] = instance.application;
  val['refType'] = instance.refType;
  val['refId'] = instance.refId;
  val['type'] = instance.type;
  val['content'] = instance.content;
  writeNotNull('attachments', instance.attachments);
  return val;
}
