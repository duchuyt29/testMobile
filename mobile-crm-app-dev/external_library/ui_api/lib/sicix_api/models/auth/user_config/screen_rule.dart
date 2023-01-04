import 'package:json_annotation/json_annotation.dart';

part 'screen_rule.g.dart';

@JsonSerializable()
class ScreenRule {
  List<int>? groupIds;
  List<int>? policyIds;

  ScreenRule({this.groupIds, this.policyIds});

  factory ScreenRule.fromJson(Map<String, dynamic> json) {
    return _$ScreenRuleFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ScreenRuleToJson(this);
}
