// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_family_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductFamilyResponse _$ProductFamilyResponseFromJson(
        Map<String, dynamic> json) =>
    ProductFamilyResponse(
      data: json['data'] == null
          ? null
          : ProductFamily.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..code = json['code'] as String?
      ..success = json['success'] as bool? ?? false
      ..title = json['title'] as String?
      ..message = json['message'] as String?;

Map<String, dynamic> _$ProductFamilyResponseToJson(
        ProductFamilyResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'success': instance.success,
      'title': instance.title,
      'message': instance.message,
      'data': instance.data,
    };
