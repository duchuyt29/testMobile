// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forward_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForwardRequest _$ForwardRequestFromJson(Map<String, dynamic> json) =>
    ForwardRequest(
      json['type'] as String,
      json['to'] as int,
      json['content'] as String,
    );

Map<String, dynamic> _$ForwardRequestToJson(ForwardRequest instance) =>
    <String, dynamic>{
      'type': instance.type,
      'to': instance.to,
      'content': instance.content,
    };
