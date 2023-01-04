import 'package:json_annotation/json_annotation.dart';

import '../../models/lead/lead_used.dart';
import '../base_response.dart';

part 'lead_used_response.g.dart';

@JsonSerializable()
class LeadUsedResponse extends BaseResponse {
  @JsonKey(name: 'data')
  LeadUsed? data;

  LeadUsedResponse({this.data}) : super(false);

  factory LeadUsedResponse.fromJson(Map<String, dynamic> json) =>
      _$LeadUsedResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$LeadUsedResponseToJson(this);
}
