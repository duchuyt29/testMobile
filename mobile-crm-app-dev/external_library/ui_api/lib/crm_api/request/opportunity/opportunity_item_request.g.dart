// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'opportunity_item_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OpportunityItem _$OpportunityItemFromJson(Map<String, dynamic> json) =>
    OpportunityItem(
      opportunityId: json['opportunityId'] as int?,
      productPriceId: json['productPriceId'] as int?,
      productId: json['productId'] as int?,
      quantity: json['quantity'] as int?,
      salePrice: json['salePrice'] as int?,
      description: json['description'] as String?,
      status: json['status'] as int?,
      listPrice: (json['listPrice'] as num?)?.toDouble(),
      id: json['id'] as int?,
    );

Map<String, dynamic> _$OpportunityItemToJson(OpportunityItem instance) =>
    <String, dynamic>{
      'opportunityId': instance.opportunityId,
      'productPriceId': instance.productPriceId,
      'productId': instance.productId,
      'quantity': instance.quantity,
      'salePrice': instance.salePrice,
      'description': instance.description,
      'status': instance.status,
      'listPrice': instance.listPrice,
      'id': instance.id,
    };

OpportunityItemsRequest _$OpportunityItemsRequestFromJson(
        Map<String, dynamic> json) =>
    OpportunityItemsRequest(
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => OpportunityItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OpportunityItemsRequestToJson(
        OpportunityItemsRequest instance) =>
    <String, dynamic>{
      'items': instance.items,
    };
