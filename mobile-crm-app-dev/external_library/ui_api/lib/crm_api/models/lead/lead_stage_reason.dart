import 'package:json_annotation/json_annotation.dart';

part 'lead_stage_reason.g.dart';

@JsonSerializable()
class LeadStageReason {
  String? leadStageReasonName;
  int? id;

  LeadStageReason({this.leadStageReasonName, this.id});

  factory LeadStageReason.fromJson(Map<String, dynamic> json) {
    return _$LeadStageReasonFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LeadStageReasonToJson(this);
}
