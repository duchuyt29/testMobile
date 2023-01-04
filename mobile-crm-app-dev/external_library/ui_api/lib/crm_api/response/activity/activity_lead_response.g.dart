// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_lead_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActivityLeadResponse _$ActivityLeadResponseFromJson(
        Map<String, dynamic> json) =>
    ActivityLeadResponse(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => ActivityLead.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..code = json['code'] as String?
      ..success = json['success'] as bool? ?? false
      ..title = json['title'] as String?
      ..message = json['message'] as String?;

Map<String, dynamic> _$ActivityLeadResponseToJson(
        ActivityLeadResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'success': instance.success,
      'title': instance.title,
      'message': instance.message,
      'data': instance.data,
    };
