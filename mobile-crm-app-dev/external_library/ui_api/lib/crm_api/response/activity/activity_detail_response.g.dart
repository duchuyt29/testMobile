// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_detail_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActivityDetailResponse _$ActivityDetailResponseFromJson(
        Map<String, dynamic> json) =>
    ActivityDetailResponse(
      data: json['data'] == null
          ? null
          : ActivityDetailData.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..code = json['code'] as String?
      ..success = json['success'] as bool? ?? false
      ..title = json['title'] as String?
      ..message = json['message'] as String?;

Map<String, dynamic> _$ActivityDetailResponseToJson(
        ActivityDetailResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'success': instance.success,
      'title': instance.title,
      'message': instance.message,
      'data': instance.data,
    };

ActivityDetailData _$ActivityDetailDataFromJson(Map<String, dynamic> json) =>
    ActivityDetailData(
      task: json['task'] == null
          ? null
          : ActivityTaskDetail.fromJson(json['task'] as Map<String, dynamic>),
      involves: (json['involves'] as List<dynamic>?)
          ?.map((e) => ActivityInvolves.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ActivityDetailDataToJson(ActivityDetailData instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('task', instance.task);
  writeNotNull('involves', instance.involves);
  return val;
}
