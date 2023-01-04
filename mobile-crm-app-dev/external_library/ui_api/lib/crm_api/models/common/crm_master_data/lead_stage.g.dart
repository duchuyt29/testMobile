// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lead_stage.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LeadStage _$LeadStageFromJson(Map<String, dynamic> json) => LeadStage(
      leadStageName: json['leadStageName'] as String?,
      id: json['id'] as int?,
      subLeadStages: (json['subLeadStages'] as List<dynamic>?)
          ?.map((e) => LeadStage.fromJson(e as Map<String, dynamic>))
          .toList(),
    )..leadStageReason = json['leadStageReason'] == null
        ? null
        : LeadStageReason.fromJson(
            json['leadStageReason'] as Map<String, dynamic>);

Map<String, dynamic> _$LeadStageToJson(LeadStage instance) => <String, dynamic>{
      'leadStageName': instance.leadStageName,
      'id': instance.id,
      'subLeadStages': instance.subLeadStages,
      'leadStageReason': instance.leadStageReason,
    };
