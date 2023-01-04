// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_file_info_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MediaFileInfoResponse _$MediaFileInfoResponseFromJson(
        Map<String, dynamic> json) =>
    MediaFileInfoResponse(
      json['data'] == null
          ? null
          : MediaFile.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..code = json['code'] as String?
      ..success = json['success'] as bool? ?? false
      ..title = json['title'] as String?
      ..message = json['message'] as String?;

Map<String, dynamic> _$MediaFileInfoResponseToJson(
        MediaFileInfoResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'success': instance.success,
      'title': instance.title,
      'message': instance.message,
      'data': instance.data,
    };
