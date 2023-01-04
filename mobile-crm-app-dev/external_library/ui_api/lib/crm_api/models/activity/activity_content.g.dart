// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_content.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActivityContent _$ActivityContentFromJson(Map<String, dynamic> json) =>
    ActivityContent(
      task: json['task'] == null
          ? null
          : ActivityTask.fromJson(json['task'] as Map<String, dynamic>),
      involves: (json['involves'] as List<dynamic>?)
          ?.map((e) => ActivityInvolves.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ActivityContentToJson(ActivityContent instance) {
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
