// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_viewer_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostViewerResponse _$PostViewerResponseFromJson(Map<String, dynamic> json) =>
    PostViewerResponse(
      data: json['data'] == null
          ? null
          : UserViewerData.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..code = json['code'] as String?
      ..success = json['success'] as bool? ?? false
      ..title = json['title'] as String?
      ..message = json['message'] as String?;

Map<String, dynamic> _$PostViewerResponseToJson(PostViewerResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'success': instance.success,
      'title': instance.title,
      'message': instance.message,
      'data': instance.data,
    };
