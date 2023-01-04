// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_price.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductPrice _$ProductPriceFromJson(Map<String, dynamic> json) => ProductPrice(
      currencyCode: json['currencyCode'] as String?,
      productId: json['productId'] as int?,
      productName: json['productName'] as String?,
      standardProductPriceId: json['standardProductPriceId'] as int?,
      currencyExchangeRateId: json['currencyExchangeRateId'] as int?,
      isStandard: json['isStandard'] as int?,
      useStandardPriceList: json['useStandardPriceList'] as int?,
      listPrice: (json['listPrice'] as num?)?.toDouble(),
      currencyName: json['currencyName'] as String?,
      productCode: json['productCode'] as String?,
      id: json['id'] as int?,
      status: json['status'] as int?,
    );

Map<String, dynamic> _$ProductPriceToJson(ProductPrice instance) =>
    <String, dynamic>{
      'currencyCode': instance.currencyCode,
      'productId': instance.productId,
      'productName': instance.productName,
      'standardProductPriceId': instance.standardProductPriceId,
      'currencyExchangeRateId': instance.currencyExchangeRateId,
      'isStandard': instance.isStandard,
      'useStandardPriceList': instance.useStandardPriceList,
      'listPrice': instance.listPrice,
      'currencyName': instance.currencyName,
      'productCode': instance.productCode,
      'id': instance.id,
      'status': instance.status,
    };
