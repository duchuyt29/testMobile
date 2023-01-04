// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'poll.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Poll _$PollFromJson(Map<String, dynamic> json) => Poll(
      multiChoice: json['multiChoice'] as int?,
      userAnswer:
          (json['userAnswer'] as List<dynamic>?)?.map((e) => e as int).toList(),
      answers: (json['answers'] as List<dynamic>?)
          ?.map((e) => Answer.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: json['id'] as int?,
      refId: json['refId'] as int?,
      state: json['state'] as String?,
      title: json['title'] as String?,
      deadline: json['deadline'] == null
          ? null
          : DateTime.parse(json['deadline'] as String),
    );

Map<String, dynamic> _$PollToJson(Poll instance) => <String, dynamic>{
      'multiChoice': instance.multiChoice,
      'userAnswer': instance.userAnswer,
      'answers': instance.answers,
      'id': instance.id,
      'refId': instance.refId,
      'state': instance.state,
      'title': instance.title,
      'deadline': instance.deadline?.toIso8601String(),
    };
