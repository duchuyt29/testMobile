// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_family.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductFamily _$ProductFamilyFromJson(Map<String, dynamic> json) =>
    ProductFamily(
      id: json['id'] as int?,
      productFamilyName: json['productFamilyName'] as String?,
      productFamilyCode: json['productFamilyCode'] as String?,
      description: json['description'] as String?,
      createDate: json['createDate'] == null
          ? null
          : DateTime.parse(json['createDate'] as String),
      modifiedDate: json['modifiedDate'] == null
          ? null
          : DateTime.parse(json['modifiedDate'] as String),
      status: json['status'] as int?,
      createBy: json['createBy'] as String?,
      updateBy: json['updateBy'] as String?,
    );

Map<String, dynamic> _$ProductFamilyToJson(ProductFamily instance) =>
    <String, dynamic>{
      'id': instance.id,
      'productFamilyName': instance.productFamilyName,
      'productFamilyCode': instance.productFamilyCode,
      'description': instance.description,
      'createDate': instance.createDate?.toIso8601String(),
      'modifiedDate': instance.modifiedDate?.toIso8601String(),
      'status': instance.status,
      'createBy': instance.createBy,
      'updateBy': instance.updateBy,
    };
