// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'opportunity_stage_reason_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OpportunityStageReason _$OpportunityStageReasonFromJson(
        Map<String, dynamic> json) =>
    OpportunityStageReason(
      id: json['id'] as int?,
      opportunityStageReasonName: json['opportunityStageReasonName'] as String?,
    );

Map<String, dynamic> _$OpportunityStageReasonToJson(
        OpportunityStageReason instance) =>
    <String, dynamic>{
      'id': instance.id,
      'opportunityStageReasonName': instance.opportunityStageReasonName,
    };

OpportunityStageReasonResponse _$OpportunityStageReasonResponseFromJson(
        Map<String, dynamic> json) =>
    OpportunityStageReasonResponse(
      data: (json['data'] as List<dynamic>?)
              ?.map((e) =>
                  OpportunityStageReason.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    )
      ..code = json['code'] as String?
      ..success = json['success'] as bool? ?? false
      ..title = json['title'] as String?
      ..message = json['message'] as String?;

Map<String, dynamic> _$OpportunityStageReasonResponseToJson(
        OpportunityStageReasonResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'success': instance.success,
      'title': instance.title,
      'message': instance.message,
      'data': instance.data,
    };
