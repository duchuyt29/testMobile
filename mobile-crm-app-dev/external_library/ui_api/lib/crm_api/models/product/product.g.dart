// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      id: json['id'] as int?,
      productCode: json['productCode'] as String?,
      productName: json['productName'] as String?,
      productFamilyId: json['productFamilyId'] as int?,
      productFamilyName: json['productFamilyName'] as String?,
      description: json['description'] as String?,
      status: json['status'] as int?,
      createBy: json['createBy'] as String?,
      updateBy: json['updateBy'] as String?,
      createDate: json['createDate'] as String?,
      modifiedDate: json['modifiedDate'] as String?,
      productId: json['productId'] as int?,
    );

Map<String, dynamic> _$ProductToJson(Product instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('productId', instance.productId);
  writeNotNull('status', instance.status);
  writeNotNull('productCode', instance.productCode);
  writeNotNull('productName', instance.productName);
  writeNotNull('productFamilyId', instance.productFamilyId);
  writeNotNull('productFamilyName', instance.productFamilyName);
  writeNotNull('description', instance.description);
  writeNotNull('createBy', instance.createBy);
  writeNotNull('updateBy', instance.updateBy);
  writeNotNull('createDate', instance.createDate);
  writeNotNull('modifiedDate', instance.modifiedDate);
  return val;
}
