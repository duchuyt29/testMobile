// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lead_info_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LeadInfoRequest _$LeadInfoRequestFromJson(Map<String, dynamic> json) =>
    LeadInfoRequest(
      id: json['id'] as int?,
      leadName: json['leadName'] as String?,
      genderId: json['genderId'] as int?,
      leadPhone: json['leadPhone'] as String?,
      salutationId: json['salutationId'] as int?,
      leadEmail: json['leadEmail'] as String?,
      leadTitle: json['leadTitle'] as String?,
      company: json['company'] as String?,
      leadIndustryId: json['leadIndustryId'] as int?,
      leadSourceId: json['leadSourceId'] as int?,
      sourceDescription: json['sourceDescription'] as String?,
    );

Map<String, dynamic> _$LeadInfoRequestToJson(LeadInfoRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('leadName', instance.leadName);
  writeNotNull('genderId', instance.genderId);
  writeNotNull('leadPhone', instance.leadPhone);
  writeNotNull('salutationId', instance.salutationId);
  writeNotNull('leadEmail', instance.leadEmail);
  writeNotNull('leadTitle', instance.leadTitle);
  writeNotNull('company', instance.company);
  writeNotNull('leadIndustryId', instance.leadIndustryId);
  writeNotNull('leadSourceId', instance.leadSourceId);
  writeNotNull('sourceDescription', instance.sourceDescription);
  return val;
}
