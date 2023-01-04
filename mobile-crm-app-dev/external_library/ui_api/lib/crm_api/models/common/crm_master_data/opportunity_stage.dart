import 'package:json_annotation/json_annotation.dart';

import '../../../response/opporunity/opportunity_stage_reason_response.dart';

part 'opportunity_stage.g.dart';

@JsonSerializable()
class OpportunityStage {
  int? id;
  String? opportunityStageName;
  List<OpportunityStage>? subOpportunityStages;
  OpportunityStageReason? oppStageReason;

  OpportunityStage(
      {this.id,
      this.opportunityStageName,
      this.subOpportunityStages,
      this.oppStageReason});

  factory OpportunityStage.fromJson(Map<String, dynamic> json) {
    return _$OpportunityStageFromJson(json);
  }

  Map<String, dynamic> toJson() => _$OpportunityStageToJson(this);
}
