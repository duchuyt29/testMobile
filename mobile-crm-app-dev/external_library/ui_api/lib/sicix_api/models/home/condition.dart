import 'package:json_annotation/json_annotation.dart';

part 'condition.g.dart';

// @JsonSerializable()
// class Conditions {
//   final String? logicOperator;
//   final String? conditionType;
//   final String? filterType;
//   final List<ChildCondition>? children;

//   const Conditions({
//     this.logicOperator,
//     this.conditionType,
//     this.filterType,
//     this.children,
//   });

//   factory Conditions.fromJson(Map<String, dynamic> json) =>
//       _$ConditionsFromJson(json);

//   Map<String, dynamic> toJson() => _$ConditionsToJson(this);
// }

@JsonSerializable(includeIfNull: false)
class Condition {
  final String? logicOperator;
  final String? conditionType;
  final String? filterType;
  final List<Condition>? children;
  final String? fieldType;
  final String? fieldName;
  final String? operator;
  final List<dynamic>? values;

  const Condition({
    this.logicOperator,
    this.conditionType,
    this.filterType,
    this.children,
    this.fieldType,
    this.fieldName,
    this.operator,
    this.values,
  });

  factory Condition.fromJson(Map<String, dynamic> json) =>
      _$ConditionFromJson(json);

  Map<String, dynamic> toJson() => _$ConditionToJson(this);
}
