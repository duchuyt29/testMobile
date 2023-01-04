import 'package:json_annotation/json_annotation.dart';

import '../../models/lead/lead_detail.dart';
import '../base_response.dart';

part 'lead_detail_response.g.dart';

@JsonSerializable()
class LeadDetailResponse extends BaseResponse {
  @JsonKey(name: 'data')
  LeadDetail? data;

  LeadDetailResponse({this.data}) : super(false);

  factory LeadDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$LeadDetailResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$LeadDetailResponseToJson(this);
}
