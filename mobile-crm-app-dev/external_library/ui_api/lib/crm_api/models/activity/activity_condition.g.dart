// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_condition.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActivityCondition _$ActivityConditionFromJson(Map<String, dynamic> json) =>
    ActivityCondition(
      logicOperator: json['logicOperator'] as String?,
      conditionType: json['conditionType'] as String?,
      filterType: json['filterType'] as String?,
      children: (json['children'] as List<dynamic>?)
          ?.map((e) => ActivityCondition.fromJson(e as Map<String, dynamic>))
          .toList(),
      fieldType: json['fieldType'] as String?,
      fieldName: json['fieldName'] as String?,
      operator: json['operator'] as String?,
      values: json['values'] as List<dynamic>?,
    );

Map<String, dynamic> _$ActivityConditionToJson(ActivityCondition instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('logicOperator', instance.logicOperator);
  writeNotNull('conditionType', instance.conditionType);
  writeNotNull('filterType', instance.filterType);
  writeNotNull('children', instance.children);
  writeNotNull('fieldType', instance.fieldType);
  writeNotNull('fieldName', instance.fieldName);
  writeNotNull('operator', instance.operator);
  writeNotNull('values', instance.values);
  return val;
}
