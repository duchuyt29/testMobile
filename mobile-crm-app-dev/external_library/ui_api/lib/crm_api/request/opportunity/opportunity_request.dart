import 'package:json_annotation/json_annotation.dart';

part 'opportunity_request.g.dart';

@JsonSerializable()
class OpportunityRequest {
  int? employeeId;
  String? opportunityCode;
  String? opportunityName;
  int? accountId;
  int? stageId;
  int? typeId;
  int? stageReasonId;
  double? probability;
  int? currencyExchangeRateId;
  String? description;
  String? closeDate;
  String? opportunityUUID;
  int? leadSourceId;
  String? startDate;
  double? amount;

  OpportunityRequest(
      {this.employeeId,
      this.opportunityCode,
      this.opportunityName,
      this.accountId,
      this.stageId,
      this.typeId,
      this.stageReasonId,
      this.probability,
      this.currencyExchangeRateId,
      this.description,
      this.closeDate,
      this.opportunityUUID,
      this.leadSourceId,
      this.amount,
      this.startDate});

  factory OpportunityRequest.fromJson(Map<String, dynamic> json) =>
      _$OpportunityRequestFromJson(json);

  Map<String, dynamic> toJson() => _$OpportunityRequestToJson(this);
}
