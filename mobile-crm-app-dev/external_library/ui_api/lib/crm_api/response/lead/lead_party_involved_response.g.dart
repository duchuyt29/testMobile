// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lead_party_involved_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LeadPartyInvolvedResponse _$LeadPartyInvolvedResponseFromJson(
        Map<String, dynamic> json) =>
    LeadPartyInvolvedResponse(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => LeadPartyInvolved.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..code = json['code'] as String?
      ..success = json['success'] as bool? ?? false
      ..title = json['title'] as String?
      ..message = json['message'] as String?;

Map<String, dynamic> _$LeadPartyInvolvedResponseToJson(
        LeadPartyInvolvedResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'success': instance.success,
      'title': instance.title,
      'message': instance.message,
      'data': instance.data,
    };
