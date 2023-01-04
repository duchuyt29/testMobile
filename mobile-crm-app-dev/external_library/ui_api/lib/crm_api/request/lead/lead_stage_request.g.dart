// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lead_stage_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LeadStageRequest _$LeadStageRequestFromJson(Map<String, dynamic> json) =>
    LeadStageRequest(
      leadStageId: json['leadStageId'] as int?,
      leadStageReasonId: json['leadStageReasonId'] as int?,
    );

Map<String, dynamic> _$LeadStageRequestToJson(LeadStageRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('leadStageId', instance.leadStageId);
  writeNotNull('leadStageReasonId', instance.leadStageReasonId);
  return val;
}
