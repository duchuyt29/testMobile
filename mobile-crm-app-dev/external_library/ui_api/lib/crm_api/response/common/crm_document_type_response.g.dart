// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crm_document_type_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CrmDocumentTypeResponse _$CrmDocumentTypeResponseFromJson(
        Map<String, dynamic> json) =>
    CrmDocumentTypeResponse(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => DocumentType.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..code = json['code'] as String?
      ..success = json['success'] as bool? ?? false
      ..title = json['title'] as String?
      ..message = json['message'] as String?;

Map<String, dynamic> _$CrmDocumentTypeResponseToJson(
        CrmDocumentTypeResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'success': instance.success,
      'title': instance.title,
      'message': instance.message,
      'data': instance.data,
    };
