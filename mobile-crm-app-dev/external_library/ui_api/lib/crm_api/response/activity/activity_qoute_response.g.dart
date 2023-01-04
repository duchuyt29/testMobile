// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_qoute_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActivityQouteResponse _$ActivityQouteResponseFromJson(
        Map<String, dynamic> json) =>
    ActivityQouteResponse(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => ActivityQoute.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..code = json['code'] as String?
      ..success = json['success'] as bool? ?? false
      ..title = json['title'] as String?
      ..message = json['message'] as String?;

Map<String, dynamic> _$ActivityQouteResponseToJson(
        ActivityQouteResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'success': instance.success,
      'title': instance.title,
      'message': instance.message,
      'data': instance.data,
    };
