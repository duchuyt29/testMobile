import 'package:json_annotation/json_annotation.dart';

import '../../models/activity/activity_contract.dart';
import '../base_response.dart';

part 'activity_contract_response.g.dart';

@JsonSerializable()
class ActivityContractResponse extends BaseResponse {
  @JsonKey(name: 'data')
  List<ActivityContract>? data;
  ActivityContractResponse({this.data}) : super(false);

  factory ActivityContractResponse.fromJson(Map<String, dynamic> json) =>
      _$ActivityContractResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ActivityContractResponseToJson(this);
}
