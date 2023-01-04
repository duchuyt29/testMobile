// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'opportunity_product_item_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OpportunityProductItemResponse _$OpportunityProductItemResponseFromJson(
        Map<String, dynamic> json) =>
    OpportunityProductItemResponse(
      data: (json['data'] as List<dynamic>?)
              ?.map((e) =>
                  OpportunityProductItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    )
      ..code = json['code'] as String?
      ..success = json['success'] as bool? ?? false
      ..title = json['title'] as String?
      ..message = json['message'] as String?;

Map<String, dynamic> _$OpportunityProductItemResponseToJson(
        OpportunityProductItemResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'success': instance.success,
      'title': instance.title,
      'message': instance.message,
      'data': instance.data,
    };
