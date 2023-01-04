// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_party_involved_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountPartyInvolvedResponse _$AccountPartyInvolvedResponseFromJson(
        Map<String, dynamic> json) =>
    AccountPartyInvolvedResponse(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => AccountPartyInvolved.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..code = json['code'] as String?
      ..success = json['success'] as bool? ?? false
      ..title = json['title'] as String?
      ..message = json['message'] as String?;

Map<String, dynamic> _$AccountPartyInvolvedResponseToJson(
        AccountPartyInvolvedResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'success': instance.success,
      'title': instance.title,
      'message': instance.message,
      'data': instance.data,
    };
