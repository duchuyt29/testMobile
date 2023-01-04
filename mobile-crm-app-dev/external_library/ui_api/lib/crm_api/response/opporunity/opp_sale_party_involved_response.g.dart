// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'opp_sale_party_involved_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OppSalePartyInvolvedListResponse _$OppSalePartyInvolvedListResponseFromJson(
        Map<String, dynamic> json) =>
    OppSalePartyInvolvedListResponse(
      data: (json['data'] as List<dynamic>?)
              ?.map((e) =>
                  OppSalePartyInvolved.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    )
      ..code = json['code'] as String?
      ..success = json['success'] as bool? ?? false
      ..title = json['title'] as String?
      ..message = json['message'] as String?;

Map<String, dynamic> _$OppSalePartyInvolvedListResponseToJson(
        OppSalePartyInvolvedListResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'success': instance.success,
      'title': instance.title,
      'message': instance.message,
      'data': instance.data,
    };
