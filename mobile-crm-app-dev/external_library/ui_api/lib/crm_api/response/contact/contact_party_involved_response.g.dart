// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_party_involved_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContactPartyInvolvedResponse _$ContactPartyInvolvedResponseFromJson(
        Map<String, dynamic> json) =>
    ContactPartyInvolvedResponse(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => ContactPartyInvolved.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..code = json['code'] as String?
      ..success = json['success'] as bool? ?? false
      ..title = json['title'] as String?
      ..message = json['message'] as String?;

Map<String, dynamic> _$ContactPartyInvolvedResponseToJson(
        ContactPartyInvolvedResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'success': instance.success,
      'title': instance.title,
      'message': instance.message,
      'data': instance.data,
    };
