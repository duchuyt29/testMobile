// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lead_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LeadModels _$LeadModelsFromJson(Map<String, dynamic> json) => LeadModels(
      content: (json['content'] as List<dynamic>?)
              ?.map((e) => LeadModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    )
      ..pageSize = json['pageSize'] as int?
      ..page = json['page'] as int?
      ..total = json['total'] as int?;

Map<String, dynamic> _$LeadModelsToJson(LeadModels instance) =>
    <String, dynamic>{
      'pageSize': instance.pageSize,
      'page': instance.page,
      'total': instance.total,
      'content': instance.content,
    };
