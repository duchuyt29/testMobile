import 'package:json_annotation/json_annotation.dart';

import '../../models/activity/activity_opp.dart';
import '../base_response.dart';

part 'activity_opp_response.g.dart';

@JsonSerializable()
class ActivityOppResponse extends BaseResponse {
  @JsonKey(name: 'data')
  List<ActivityOpp>? data;
  ActivityOppResponse({this.data}) : super(false);

  factory ActivityOppResponse.fromJson(Map<String, dynamic> json) =>
      _$ActivityOppResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ActivityOppResponseToJson(this);
}
