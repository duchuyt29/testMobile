// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'opp_account_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OppAccountResponse _$OppAccountResponseFromJson(Map<String, dynamic> json) =>
    OppAccountResponse(
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => OppAccount.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    )
      ..code = json['code'] as String?
      ..success = json['success'] as bool? ?? false
      ..title = json['title'] as String?
      ..message = json['message'] as String?;

Map<String, dynamic> _$OppAccountResponseToJson(OppAccountResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'success': instance.success,
      'title': instance.title,
      'message': instance.message,
      'data': instance.data,
    };
