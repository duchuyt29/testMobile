// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_price_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductPriceRequest _$ProductPriceRequestFromJson(Map<String, dynamic> json) =>
    ProductPriceRequest(
      id: json['id'] as int?,
      currencyCode: json['currencyCode'] as String?,
      currencyName: json['currencyName'] as String?,
      listPrice: (json['listPrice'] as num?)?.toDouble(),
      priceCode: json['priceCode'] as String?,
      priceName: json['priceName'] as String?,
    );

Map<String, dynamic> _$ProductPriceRequestToJson(
        ProductPriceRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'currencyCode': instance.currencyCode,
      'currencyName': instance.currencyName,
      'listPrice': instance.listPrice,
      'priceCode': instance.priceCode,
      'priceName': instance.priceName,
    };
