// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crm_master_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CrmMasterDataResponse _$CrmMasterDataResponseFromJson(
        Map<String, dynamic> json) =>
    CrmMasterDataResponse(
      data: json['data'] == null
          ? null
          : CrmMasterData.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..code = json['code'] as String?
      ..success = json['success'] as bool? ?? false
      ..title = json['title'] as String?
      ..message = json['message'] as String?;

Map<String, dynamic> _$CrmMasterDataResponseToJson(
        CrmMasterDataResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'success': instance.success,
      'title': instance.title,
      'message': instance.message,
      'data': instance.data,
    };
