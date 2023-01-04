// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lead_additional_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LeadAdditionalRequest _$LeadAdditionalRequestFromJson(
        Map<String, dynamic> json) =>
    LeadAdditionalRequest(
      id: json['id'] as int?,
      leadStageReasonId: json['leadStageReasonId'] as int?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$LeadAdditionalRequestToJson(
    LeadAdditionalRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('leadStageReasonId', instance.leadStageReasonId);
  writeNotNull('description', instance.description);
  return val;
}
