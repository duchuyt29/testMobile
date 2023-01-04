import 'package:json_annotation/json_annotation.dart';

part 'opportunity_type.g.dart';

@JsonSerializable()
class OpportunityType {
  int? id;
  String? opportunityTypeName;

  OpportunityType({this.id, this.opportunityTypeName});

  factory OpportunityType.fromJson(Map<String, dynamic> json) {
    return _$OpportunityTypeFromJson(json);
  }

  Map<String, dynamic> toJson() => _$OpportunityTypeToJson(this);
}
