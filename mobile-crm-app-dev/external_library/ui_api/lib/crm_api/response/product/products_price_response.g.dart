// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_price_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductsPriceResponse _$ProductsPriceResponseFromJson(
        Map<String, dynamic> json) =>
    ProductsPriceResponse(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => ProductPrice.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..code = json['code'] as String?
      ..success = json['success'] as bool? ?? false
      ..title = json['title'] as String?
      ..message = json['message'] as String?;

Map<String, dynamic> _$ProductsPriceResponseToJson(
        ProductsPriceResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'success': instance.success,
      'title': instance.title,
      'message': instance.message,
      'data': instance.data,
    };
