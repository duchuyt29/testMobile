import 'package:json_annotation/json_annotation.dart';

part 'opportunity_additional_information_request.g.dart';

@JsonSerializable()
class OpportunityAdditionalInformationRequest {
  int? id;
  String? description;

  OpportunityAdditionalInformationRequest({this.id, this.description});

  factory OpportunityAdditionalInformationRequest.fromJson(
          Map<String, dynamic> json) =>
      _$OpportunityAdditionalInformationRequestFromJson(json);

  Map<String, dynamic> toJson() =>
      _$OpportunityAdditionalInformationRequestToJson(this);
}
