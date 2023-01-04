// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseModels _$BaseModelsFromJson(Map<String, dynamic> json) => BaseModels(
      pageSize: json['pageSize'] as int?,
      page: json['page'] as int?,
      total: json['total'] as int?,
    );

Map<String, dynamic> _$BaseModelsToJson(BaseModels instance) =>
    <String, dynamic>{
      'pageSize': instance.pageSize,
      'page': instance.page,
      'total': instance.total,
    };
