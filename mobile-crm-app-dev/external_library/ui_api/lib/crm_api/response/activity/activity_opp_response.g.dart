// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_opp_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActivityOppResponse _$ActivityOppResponseFromJson(Map<String, dynamic> json) =>
    ActivityOppResponse(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => ActivityOpp.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..code = json['code'] as String?
      ..success = json['success'] as bool? ?? false
      ..title = json['title'] as String?
      ..message = json['message'] as String?;

Map<String, dynamic> _$ActivityOppResponseToJson(
        ActivityOppResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'success': instance.success,
      'title': instance.title,
      'message': instance.message,
      'data': instance.data,
    };
