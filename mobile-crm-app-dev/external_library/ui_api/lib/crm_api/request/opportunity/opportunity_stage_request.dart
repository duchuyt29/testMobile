import 'package:json_annotation/json_annotation.dart';

part 'opportunity_stage_request.g.dart';

@JsonSerializable()
class OpportunityStageRequest {
  int? opportunityStageId;
  int? opportunityStageReasonId;

  OpportunityStageRequest({
    this.opportunityStageId,
    this.opportunityStageReasonId,
  });

  factory OpportunityStageRequest.fromJson(Map<String, dynamic> json) =>
      _$OpportunityStageRequestFromJson(json);

  Map<String, dynamic> toJson() => _$OpportunityStageRequestToJson(this);
}
