import 'package:json_annotation/json_annotation.dart';

part 'lead_additional_request.g.dart';

@JsonSerializable(includeIfNull: false)
class LeadAdditionalRequest {
  int? id;
  int? leadStageReasonId;
  String? description;

  LeadAdditionalRequest({
    this.id,
    this.leadStageReasonId,
    this.description,
  });

  factory LeadAdditionalRequest.fromJson(Map<String, dynamic> json) {
    return _$LeadAdditionalRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LeadAdditionalRequestToJson(this);
}
