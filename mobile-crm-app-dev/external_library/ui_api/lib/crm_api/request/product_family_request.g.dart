// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_family_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductFamilyRequest _$ProductFamilyRequestFromJson(
        Map<String, dynamic> json) =>
    ProductFamilyRequest(
      id: json['id'] as int?,
      productFamilyName: json['productFamilyName'] as String?,
      productFamilyCode: json['productFamilyCode'] as String?,
      description: json['description'] as String?,
      status: json['status'] as int?,
    );

Map<String, dynamic> _$ProductFamilyRequestToJson(
        ProductFamilyRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'productFamilyName': instance.productFamilyName,
      'productFamilyCode': instance.productFamilyCode,
      'description': instance.description,
      'status': instance.status,
    };
