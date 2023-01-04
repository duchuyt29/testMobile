// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'opportunity_info_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OpportunityInfoResponse _$OpportunityInfoResponseFromJson(
        Map<String, dynamic> json) =>
    OpportunityInfoResponse(
      data: json['data'] == null
          ? null
          : OpportunityInfo.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..code = json['code'] as String?
      ..success = json['success'] as bool? ?? false
      ..title = json['title'] as String?
      ..message = json['message'] as String?;

Map<String, dynamic> _$OpportunityInfoResponseToJson(
        OpportunityInfoResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'success': instance.success,
      'title': instance.title,
      'message': instance.message,
      'data': instance.data,
    };
