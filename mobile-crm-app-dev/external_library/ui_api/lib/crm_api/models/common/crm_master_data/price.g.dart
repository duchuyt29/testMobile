// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Price _$PriceFromJson(Map<String, dynamic> json) => Price(
      isStandard: json['isStandard'] as int?,
      id: json['id'] as int?,
      priceName: json['priceName'] as String?,
      priceCode: json['priceCode'] as String?,
      description: json['description'] as String?,
      isActive: json['isActive'] as int?,
    );

Map<String, dynamic> _$PriceToJson(Price instance) => <String, dynamic>{
      'isStandard': instance.isStandard,
      'id': instance.id,
      'priceName': instance.priceName,
      'priceCode': instance.priceCode,
      'description': instance.description,
      'isActive': instance.isActive,
    };
