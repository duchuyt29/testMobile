import 'package:json_annotation/json_annotation.dart';

part 'opportunity_status_request.g.dart';

@JsonSerializable()
class OpportunityStatusRequest {
  int? id;
  int? stageId;
  int? stageReasonId;
  String? startDate;
  String? closeDate;

  OpportunityStatusRequest({
    this.id,
    this.stageId,
    this.startDate,
    this.closeDate,
    this.stageReasonId,
  });

  factory OpportunityStatusRequest.fromJson(Map<String, dynamic> json) =>
      _$OpportunityStatusRequestFromJson(json);

  Map<String, dynamic> toJson() => _$OpportunityStatusRequestToJson(this);
}
