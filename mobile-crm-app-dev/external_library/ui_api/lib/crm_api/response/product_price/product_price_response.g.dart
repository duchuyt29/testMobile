// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_price_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductPriceResponse _$ProductPriceResponseFromJson(
        Map<String, dynamic> json) =>
    ProductPriceResponse(
      json['data'],
    )
      ..code = json['code'] as String?
      ..success = json['success'] as bool? ?? false
      ..title = json['title'] as String?
      ..message = json['message'] as String?;

Map<String, dynamic> _$ProductPriceResponseToJson(
        ProductPriceResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'success': instance.success,
      'title': instance.title,
      'message': instance.message,
      'data': instance.data,
    };
