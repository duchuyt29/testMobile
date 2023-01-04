// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conditions_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConditionsRequest _$ConditionsRequestFromJson(Map<String, dynamic> json) =>
    ConditionsRequest(
      (json['conditions'] as List<dynamic>?)
          ?.map((e) => Condition.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ConditionsRequestToJson(ConditionsRequest instance) =>
    <String, dynamic>{
      'conditions': instance.conditions,
    };
