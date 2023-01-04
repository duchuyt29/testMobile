import 'package:json_annotation/json_annotation.dart';

import '../../models/lead/lead_stage_reason.dart';
import '../base_response.dart';

part 'lead_stage_reason_response.g.dart';

@JsonSerializable()
class LeadStageReasonResponse extends BaseResponse {
  @JsonKey(name: 'data')
  List<LeadStageReason>? data;

  LeadStageReasonResponse({this.data}) : super(false);

  factory LeadStageReasonResponse.fromJson(Map<String, dynamic> json) =>
      _$LeadStageReasonResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$LeadStageReasonResponseToJson(this);
}
