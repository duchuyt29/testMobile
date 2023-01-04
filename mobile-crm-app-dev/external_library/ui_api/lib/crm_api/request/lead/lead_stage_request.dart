import 'package:json_annotation/json_annotation.dart';

part 'lead_stage_request.g.dart';

@JsonSerializable(includeIfNull: false)
class LeadStageRequest {
  int? leadStageId;
  int? leadStageReasonId;

  LeadStageRequest({this.leadStageId, this.leadStageReasonId});

  factory LeadStageRequest.fromJson(Map<String, dynamic> json) {
    return _$LeadStageRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LeadStageRequestToJson(this);
}
