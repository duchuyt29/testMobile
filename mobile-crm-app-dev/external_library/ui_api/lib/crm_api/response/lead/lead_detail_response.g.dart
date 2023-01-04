// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lead_detail_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LeadDetailResponse _$LeadDetailResponseFromJson(Map<String, dynamic> json) =>
    LeadDetailResponse(
      data: json['data'] == null
          ? null
          : LeadDetail.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..code = json['code'] as String?
      ..success = json['success'] as bool? ?? false
      ..title = json['title'] as String?
      ..message = json['message'] as String?;

Map<String, dynamic> _$LeadDetailResponseToJson(LeadDetailResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'success': instance.success,
      'title': instance.title,
      'message': instance.message,
      'data': instance.data,
    };
