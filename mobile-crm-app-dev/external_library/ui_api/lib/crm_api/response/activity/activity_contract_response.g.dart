// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_contract_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActivityContractResponse _$ActivityContractResponseFromJson(
        Map<String, dynamic> json) =>
    ActivityContractResponse(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => ActivityContract.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..code = json['code'] as String?
      ..success = json['success'] as bool? ?? false
      ..title = json['title'] as String?
      ..message = json['message'] as String?;

Map<String, dynamic> _$ActivityContractResponseToJson(
        ActivityContractResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'success': instance.success,
      'title': instance.title,
      'message': instance.message,
      'data': instance.data,
    };
