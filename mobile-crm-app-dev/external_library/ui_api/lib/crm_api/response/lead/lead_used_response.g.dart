// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lead_used_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LeadUsedResponse _$LeadUsedResponseFromJson(Map<String, dynamic> json) =>
    LeadUsedResponse(
      data: json['data'] == null
          ? null
          : LeadUsed.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..code = json['code'] as String?
      ..success = json['success'] as bool? ?? false
      ..title = json['title'] as String?
      ..message = json['message'] as String?;

Map<String, dynamic> _$LeadUsedResponseToJson(LeadUsedResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'success': instance.success,
      'title': instance.title,
      'message': instance.message,
      'data': instance.data,
    };
