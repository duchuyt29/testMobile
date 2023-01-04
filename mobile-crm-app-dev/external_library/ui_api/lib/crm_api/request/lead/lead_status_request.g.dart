// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lead_status_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LeadStatusRequest _$LeadStatusRequestFromJson(Map<String, dynamic> json) =>
    LeadStatusRequest(
      id: json['id'] as int?,
      leadStageId: json['leadStageId'] as int?,
      leadPotentialLevelId: json['leadPotentialLevelId'] as int?,
      leadStageReasonId: json['leadStageReasonId'] as int?,
      startDate: json['startDate'] == null
          ? null
          : DateTime.parse(json['startDate'] as String),
    );

Map<String, dynamic> _$LeadStatusRequestToJson(LeadStatusRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('leadStageId', instance.leadStageId);
  writeNotNull('leadPotentialLevelId', instance.leadPotentialLevelId);
  writeNotNull('leadStageReasonId', instance.leadStageReasonId);
  writeNotNull('startDate', _dateToString(instance.startDate));
  return val;
}
