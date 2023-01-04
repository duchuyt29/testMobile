// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'screen_rule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScreenRule _$ScreenRuleFromJson(Map<String, dynamic> json) => ScreenRule(
      groupIds:
          (json['groupIds'] as List<dynamic>?)?.map((e) => e as int).toList(),
      policyIds:
          (json['policyIds'] as List<dynamic>?)?.map((e) => e as int).toList(),
    );

Map<String, dynamic> _$ScreenRuleToJson(ScreenRule instance) =>
    <String, dynamic>{
      'groupIds': instance.groupIds,
      'policyIds': instance.policyIds,
    };
