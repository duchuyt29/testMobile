// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_lead.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActivityLead _$ActivityLeadFromJson(Map<String, dynamic> json) => ActivityLead(
      id: json['id'] as int?,
      leadName: json['leadName'] as String?,
      leadCode: json['leadCode'] as String?,
    );

Map<String, dynamic> _$ActivityLeadToJson(ActivityLead instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('leadName', instance.leadName);
  writeNotNull('leadCode', instance.leadCode);
  return val;
}
