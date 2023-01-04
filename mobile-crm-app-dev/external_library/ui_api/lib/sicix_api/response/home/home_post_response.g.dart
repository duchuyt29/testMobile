// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_post_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomePostResponse _$HomePostResponseFromJson(Map<String, dynamic> json) =>
    HomePostResponse(
      data: json['data'] == null
          ? null
          : HomePostData.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..code = json['code'] as String?
      ..success = json['success'] as bool? ?? false
      ..title = json['title'] as String?
      ..message = json['message'] as String?;

Map<String, dynamic> _$HomePostResponseToJson(HomePostResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'success': instance.success,
      'title': instance.title,
      'message': instance.message,
      'data': instance.data,
    };

HomePostData _$HomePostDataFromJson(Map<String, dynamic> json) => HomePostData(
      (json['content'] as List<dynamic>?)
              ?.map((e) => PostContent.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    )
      ..pageSize = json['pageSize'] as int?
      ..page = json['page'] as int?
      ..total = json['total'] as int?;

Map<String, dynamic> _$HomePostDataToJson(HomePostData instance) =>
    <String, dynamic>{
      'pageSize': instance.pageSize,
      'page': instance.page,
      'total': instance.total,
      'content': instance.content,
    };
