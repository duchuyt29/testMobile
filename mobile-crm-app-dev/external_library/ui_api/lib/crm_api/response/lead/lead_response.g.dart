// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lead_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LeadsResponse _$LeadsResponseFromJson(Map<String, dynamic> json) =>
    LeadsResponse(
      data: json['data'] == null
          ? null
          : LeadModels.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..code = json['code'] as String?
      ..success = json['success'] as bool? ?? false
      ..title = json['title'] as String?
      ..message = json['message'] as String?;

Map<String, dynamic> _$LeadsResponseToJson(LeadsResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'success': instance.success,
      'title': instance.title,
      'message': instance.message,
      'data': instance.data,
    };
