import 'package:json_annotation/json_annotation.dart';

part 'opportunity_info_request.g.dart';

@JsonSerializable()
class OpportunityInfoRequest {
  int? id;
  String? opportunityName;
  int? accountId;
  int? typeId;
  int? leadSourceId;
  double? probability;
  int? currencyExchangeRateId;

  OpportunityInfoRequest(
      {this.id,
      this.opportunityName,
      this.accountId,
      this.typeId,
      this.leadSourceId,
      this.probability,
      this.currencyExchangeRateId});

  factory OpportunityInfoRequest.fromJson(Map<String, dynamic> json) =>
      _$OpportunityInfoRequestFromJson(json);

  Map<String, dynamic> toJson() => _$OpportunityInfoRequestToJson(this);
}
