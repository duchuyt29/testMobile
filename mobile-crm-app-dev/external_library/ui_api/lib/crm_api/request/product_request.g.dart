// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductRequest _$ProductRequestFromJson(Map<String, dynamic> json) =>
    ProductRequest(
      id: json['id'] as int?,
      productCode: json['productCode'] as String?,
      productName: json['productName'] as String?,
      productFamilyId: json['productFamilyId'] as int?,
      productFamilyName: json['productFamilyName'] as String?,
      description: json['description'] as String?,
      status: json['status'] as int?,
    );

Map<String, dynamic> _$ProductRequestToJson(ProductRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'productCode': instance.productCode,
      'productName': instance.productName,
      'productFamilyId': instance.productFamilyId,
      'productFamilyName': instance.productFamilyName,
      'description': instance.description,
      'status': instance.status,
    };
