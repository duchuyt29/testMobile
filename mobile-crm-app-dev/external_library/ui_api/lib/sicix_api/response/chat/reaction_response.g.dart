// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reaction_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReactionResponse _$ReactionResponseFromJson(Map<String, dynamic> json) =>
    ReactionResponse(
      data: json['data'] == null
          ? null
          : ReactionModel.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..code = json['code'] as String?
      ..success = json['success'] as bool? ?? false
      ..title = json['title'] as String?
      ..message = json['message'] as String?;

Map<String, dynamic> _$ReactionResponseToJson(ReactionResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'success': instance.success,
      'title': instance.title,
      'message': instance.message,
      'data': instance.data,
    };
