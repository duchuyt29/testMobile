import 'package:json_annotation/json_annotation.dart';

import '../../models/lead/lead_party_involved.dart';
import '../base_response.dart';

part 'lead_party_involved_response.g.dart';

@JsonSerializable()
class LeadPartyInvolvedResponse extends BaseResponse {
  @JsonKey(name: 'data')
  List<LeadPartyInvolved>? data;

  LeadPartyInvolvedResponse({this.data}) : super(false);

  factory LeadPartyInvolvedResponse.fromJson(Map<String, dynamic> json) =>
      _$LeadPartyInvolvedResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$LeadPartyInvolvedResponseToJson(this);
}
