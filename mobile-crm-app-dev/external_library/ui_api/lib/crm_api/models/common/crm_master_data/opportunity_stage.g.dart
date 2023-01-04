// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'opportunity_stage.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OpportunityStage _$OpportunityStageFromJson(Map<String, dynamic> json) =>
    OpportunityStage(
      id: json['id'] as int?,
      opportunityStageName: json['opportunityStageName'] as String?,
      subOpportunityStages: (json['subOpportunityStages'] as List<dynamic>?)
          ?.map((e) => OpportunityStage.fromJson(e as Map<String, dynamic>))
          .toList(),
      oppStageReason: json['oppStageReason'] == null
          ? null
          : OpportunityStageReason.fromJson(
              json['oppStageReason'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OpportunityStageToJson(OpportunityStage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'opportunityStageName': instance.opportunityStageName,
      'subOpportunityStages': instance.subOpportunityStages,
      'oppStageReason': instance.oppStageReason,
    };
