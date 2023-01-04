import 'package:json_annotation/json_annotation.dart';

import '../../models/lead/lead_models.dart';
import '../base_response.dart';

part 'lead_response.g.dart';

@JsonSerializable()
class LeadsResponse extends BaseResponse {
  @JsonKey(name: 'data')
  LeadModels? data;

  LeadsResponse({this.data}) : super(false);

  factory LeadsResponse.fromJson(Map<String, dynamic> json) =>
      _$LeadsResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$LeadsResponseToJson(this);
}
