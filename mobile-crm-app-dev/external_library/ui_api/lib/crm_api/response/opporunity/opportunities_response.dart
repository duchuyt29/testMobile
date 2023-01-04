import 'package:json_annotation/json_annotation.dart';

import '../../models/opportunity/opportunity.dart';
import '../base_response.dart';

part 'opportunities_response.g.dart';

@JsonSerializable()
class OpportunitiesResponse extends BaseResponse {
  @JsonKey(name: 'data')
  Opportunities? data;
  OpportunitiesResponse({this.data}) : super(false);

  factory OpportunitiesResponse.fromJson(Map<String, dynamic> json) =>
      _$OpportunitiesResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$OpportunitiesResponseToJson(this);
}
