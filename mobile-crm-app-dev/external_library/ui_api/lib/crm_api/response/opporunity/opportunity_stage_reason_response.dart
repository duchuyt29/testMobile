import 'package:json_annotation/json_annotation.dart';

import '../base_response.dart';

part 'opportunity_stage_reason_response.g.dart';

@JsonSerializable()
class OpportunityStageReason {
  int? id;
  String? opportunityStageReasonName;

  OpportunityStageReason({this.id, this.opportunityStageReasonName});

  factory OpportunityStageReason.fromJson(Map<String, dynamic> json) =>
      _$OpportunityStageReasonFromJson(json);

  Map<String, dynamic> toJson() => _$OpportunityStageReasonToJson(this);

  bool isOppReasonIsClosedFailed() {
    return id == 7;
  }
}

@JsonSerializable()
class OpportunityStageReasonResponse extends BaseResponse {
  @JsonKey(defaultValue: [])
  List<OpportunityStageReason>? data;

  OpportunityStageReasonResponse({this.data}) : super(false);

  factory OpportunityStageReasonResponse.fromJson(Map<String, dynamic> json) =>
      _$OpportunityStageReasonResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$OpportunityStageReasonResponseToJson(this);
}
