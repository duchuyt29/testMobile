// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'opportunity_product_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OpportunityProductItem _$OpportunityProductItemFromJson(
        Map<String, dynamic> json) =>
    OpportunityProductItem(
      createDate: json['createDate'] == null
          ? null
          : DateTime.parse(json['createDate'] as String),
      modifiedDate: json['modifiedDate'] == null
          ? null
          : DateTime.parse(json['modifiedDate'] as String),
      status: json['status'] as int?,
      createBy: json['createBy'] as String?,
      updateBy: json['updateBy'] as String?,
      id: json['id'] as int?,
      opportunityId: json['opportunityId'] as int?,
      productPriceId: json['productPriceId'] as int?,
      productId: json['productId'] as int?,
      productCode: json['productCode'] as String?,
      productName: json['productName'] as String?,
      currencyExchangeRateId: json['currencyExchangeRateId'] as int?,
      quantity: (json['quantity'] as num?)?.toDouble(),
      salePrice: (json['salePrice'] as num?)?.toDouble(),
    )..listPrice = (json['listPrice'] as num?)?.toDouble();

Map<String, dynamic> _$OpportunityProductItemToJson(
        OpportunityProductItem instance) =>
    <String, dynamic>{
      'createDate': instance.createDate?.toIso8601String(),
      'modifiedDate': instance.modifiedDate?.toIso8601String(),
      'status': instance.status,
      'createBy': instance.createBy,
      'updateBy': instance.updateBy,
      'id': instance.id,
      'opportunityId': instance.opportunityId,
      'productPriceId': instance.productPriceId,
      'productId': instance.productId,
      'productCode': instance.productCode,
      'productName': instance.productName,
      'currencyExchangeRateId': instance.currencyExchangeRateId,
      'quantity': instance.quantity,
      'salePrice': instance.salePrice,
      'listPrice': instance.listPrice,
    };
