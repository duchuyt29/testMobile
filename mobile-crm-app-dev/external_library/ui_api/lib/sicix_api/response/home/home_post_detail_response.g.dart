// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_post_detail_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomePostDetailResponse _$HomePostDetailResponseFromJson(
        Map<String, dynamic> json) =>
    HomePostDetailResponse(
      data: json['data'] == null
          ? null
          : PostContent.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..code = json['code'] as String?
      ..success = json['success'] as bool? ?? false
      ..title = json['title'] as String?
      ..message = json['message'] as String?;

Map<String, dynamic> _$HomePostDetailResponseToJson(
        HomePostDetailResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'success': instance.success,
      'title': instance.title,
      'message': instance.message,
      'data': instance.data,
    };
