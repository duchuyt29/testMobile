// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'opportunity_stage_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OpportunityStageRequest _$OpportunityStageRequestFromJson(
        Map<String, dynamic> json) =>
    OpportunityStageRequest(
      opportunityStageId: json['opportunityStageId'] as int?,
      opportunityStageReasonId: json['opportunityStageReasonId'] as int?,
    );

Map<String, dynamic> _$OpportunityStageRequestToJson(
        OpportunityStageRequest instance) =>
    <String, dynamic>{
      'opportunityStageId': instance.opportunityStageId,
      'opportunityStageReasonId': instance.opportunityStageReasonId,
    };
