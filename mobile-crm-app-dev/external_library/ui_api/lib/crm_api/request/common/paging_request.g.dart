// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paging_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PagingRequest _$PagingRequestFromJson(Map<String, dynamic> json) =>
    PagingRequest(
      page: json['page'] as int? ?? 0,
      size: json['size'] as int? ?? 10,
      sort: json['sort'] as String? ?? 'id,desc',
    );

Map<String, dynamic> _$PagingRequestToJson(PagingRequest instance) =>
    <String, dynamic>{
      'page': instance.page,
      'size': instance.size,
      'sort': instance.sort,
    };
