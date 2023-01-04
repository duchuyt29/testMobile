import 'package:json_annotation/json_annotation.dart';

import '../../models/opportunity/opportunity_info.dart';
import '../base_response.dart';

part 'opportunity_info_response.g.dart';

@JsonSerializable()
class OpportunityInfoResponse extends BaseResponse {
  @JsonKey(name: 'data')
  OpportunityInfo? data;

  OpportunityInfoResponse({this.data}) : super(false);

  factory OpportunityInfoResponse.fromJson(Map<String, dynamic> json) =>
      _$OpportunityInfoResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$OpportunityInfoResponseToJson(this);
}
