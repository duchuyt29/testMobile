// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attachment_post_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AttachmentPostResponse _$AttachmentPostResponseFromJson(
        Map<String, dynamic> json) =>
    AttachmentPostResponse(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => AttachmentItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..code = json['code'] as String?
      ..success = json['success'] as bool? ?? false
      ..title = json['title'] as String?
      ..message = json['message'] as String?;

Map<String, dynamic> _$AttachmentPostResponseToJson(
        AttachmentPostResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'success': instance.success,
      'title': instance.title,
      'message': instance.message,
      'data': instance.data,
    };
