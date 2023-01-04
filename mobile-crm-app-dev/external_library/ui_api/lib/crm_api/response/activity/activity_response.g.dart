// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActivityResponse _$ActivityResponseFromJson(Map<String, dynamic> json) =>
    ActivityResponse(
      data: json['data'] == null
          ? null
          : ActivityData.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..code = json['code'] as String?
      ..success = json['success'] as bool? ?? false
      ..title = json['title'] as String?
      ..message = json['message'] as String?;

Map<String, dynamic> _$ActivityResponseToJson(ActivityResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'success': instance.success,
      'title': instance.title,
      'message': instance.message,
      'data': instance.data,
    };

ActivityData _$ActivityDataFromJson(Map<String, dynamic> json) => ActivityData(
      content: (json['content'] as List<dynamic>?)
          ?.map((e) => ActivityContent.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..pageSize = json['pageSize'] as int?
      ..page = json['page'] as int?
      ..total = json['total'] as int?;

Map<String, dynamic> _$ActivityDataToJson(ActivityData instance) =>
    <String, dynamic>{
      'pageSize': instance.pageSize,
      'page': instance.page,
      'total': instance.total,
      'content': instance.content,
    };
