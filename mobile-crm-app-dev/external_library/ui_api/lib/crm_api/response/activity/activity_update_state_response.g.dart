// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_update_state_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActivityUpdateStateResponse _$ActivityUpdateStateResponseFromJson(
        Map<String, dynamic> json) =>
    ActivityUpdateStateResponse(
      data: json['data'] == null
          ? null
          : ActivityUpdateStateData.fromJson(
              json['data'] as Map<String, dynamic>),
    )
      ..code = json['code'] as String?
      ..success = json['success'] as bool? ?? false
      ..title = json['title'] as String?
      ..message = json['message'] as String?;

Map<String, dynamic> _$ActivityUpdateStateResponseToJson(
        ActivityUpdateStateResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'success': instance.success,
      'title': instance.title,
      'message': instance.message,
      'data': instance.data,
    };

ActivityUpdateStateData _$ActivityUpdateStateDataFromJson(
        Map<String, dynamic> json) =>
    ActivityUpdateStateData(
      task: json['task'] == null
          ? null
          : ActivityTaskDetail.fromJson(json['task'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ActivityUpdateStateDataToJson(
    ActivityUpdateStateData instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('task', instance.task);
  return val;
}
