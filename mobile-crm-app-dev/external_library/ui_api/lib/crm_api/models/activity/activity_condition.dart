import 'package:json_annotation/json_annotation.dart';

part 'activity_condition.g.dart';

@JsonSerializable(includeIfNull: false)
class ActivityCondition {
  final String? logicOperator;
  final String? conditionType;
  final String? filterType;
  final List<ActivityCondition>? children;
  final String? fieldType;
  final String? fieldName;
  final String? operator;
  final List<dynamic>? values;

  const ActivityCondition({
    this.logicOperator,
    this.conditionType,
    this.filterType,
    this.children,
    this.fieldType,
    this.fieldName,
    this.operator,
    this.values,
  });

  factory ActivityCondition.fromJson(Map<String, dynamic> json) =>
      _$ActivityConditionFromJson(json);

  Map<String, dynamic> toJson() => _$ActivityConditionToJson(this);
}
