// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'opportunity_status_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OpportunityStatusRequest _$OpportunityStatusRequestFromJson(
        Map<String, dynamic> json) =>
    OpportunityStatusRequest(
      id: json['id'] as int?,
      stageId: json['stageId'] as int?,
      startDate: json['startDate'] as String?,
      closeDate: json['closeDate'] as String?,
      stageReasonId: json['stageReasonId'] as int?,
    );

Map<String, dynamic> _$OpportunityStatusRequestToJson(
        OpportunityStatusRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'stageId': instance.stageId,
      'stageReasonId': instance.stageReasonId,
      'startDate': instance.startDate,
      'closeDate': instance.closeDate,
    };
