// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_attach_file_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageAttachFileResponse _$MessageAttachFileResponseFromJson(
        Map<String, dynamic> json) =>
    MessageAttachFileResponse(
      data: json['data'] == null
          ? null
          : MessageAttachFiles.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..code = json['code'] as String?
      ..success = json['success'] as bool? ?? false
      ..title = json['title'] as String?
      ..message = json['message'] as String?;

Map<String, dynamic> _$MessageAttachFileResponseToJson(
        MessageAttachFileResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'success': instance.success,
      'title': instance.title,
      'message': instance.message,
      'data': instance.data,
    };
