// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lead_stage_reason_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LeadStageReasonResponse _$LeadStageReasonResponseFromJson(
        Map<String, dynamic> json) =>
    LeadStageReasonResponse(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => LeadStageReason.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..code = json['code'] as String?
      ..success = json['success'] as bool? ?? false
      ..title = json['title'] as String?
      ..message = json['message'] as String?;

Map<String, dynamic> _$LeadStageReasonResponseToJson(
        LeadStageReasonResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'success': instance.success,
      'title': instance.title,
      'message': instance.message,
      'data': instance.data,
    };
