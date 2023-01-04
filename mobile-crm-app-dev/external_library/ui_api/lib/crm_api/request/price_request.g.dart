// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PriceRequest _$PriceRequestFromJson(Map<String, dynamic> json) => PriceRequest(
      id: json['id'] as int?,
      isActive: json['isActive'] as int?,
      isStandard: json['isStandard'] as int?,
      status: json['status'] as int?,
      priceCode: json['priceCode'] as String?,
      priceName: json['priceName'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$PriceRequestToJson(PriceRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'isActive': instance.isActive,
      'isStandard': instance.isStandard,
      'status': instance.status,
      'priceCode': instance.priceCode,
      'priceName': instance.priceName,
      'description': instance.description,
    };
