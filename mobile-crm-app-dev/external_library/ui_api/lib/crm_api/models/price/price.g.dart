// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Price _$PriceFromJson(Map<String, dynamic> json) => Price(
      id: json['id'] as int?,
      isActive: json['isActive'] as int?,
      status: json['status'] as int?,
      isStandard: json['isStandard'] as int?,
      priceCode: json['priceCode'] as String?,
      priceName: json['priceName'] as String?,
      createDate: json['createDate'] as String?,
      createBy: json['createBy'] as String?,
      modifiedDate: json['modifiedDate'] as String?,
      updateBy: json['updateBy'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$PriceToJson(Price instance) => <String, dynamic>{
      'id': instance.id,
      'isActive': instance.isActive,
      'isStandard': instance.isStandard,
      'status': instance.status,
      'priceCode': instance.priceCode,
      'priceName': instance.priceName,
      'description': instance.description,
      'createDate': instance.createDate,
      'createBy': instance.createBy,
      'modifiedDate': instance.modifiedDate,
      'updateBy': instance.updateBy,
    };
