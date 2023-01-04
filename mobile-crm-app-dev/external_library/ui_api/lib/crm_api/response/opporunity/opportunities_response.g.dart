// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'opportunities_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OpportunitiesResponse _$OpportunitiesResponseFromJson(
        Map<String, dynamic> json) =>
    OpportunitiesResponse(
      data: json['data'] == null
          ? null
          : Opportunities.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..code = json['code'] as String?
      ..success = json['success'] as bool? ?? false
      ..title = json['title'] as String?
      ..message = json['message'] as String?;

Map<String, dynamic> _$OpportunitiesResponseToJson(
        OpportunitiesResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'success': instance.success,
      'title': instance.title,
      'message': instance.message,
      'data': instance.data,
    };
