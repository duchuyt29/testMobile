import 'package:json_annotation/json_annotation.dart';

import '../../models/activity/activity_qoute.dart';
import '../base_response.dart';

part 'activity_qoute_response.g.dart';

@JsonSerializable()
class ActivityQouteResponse extends BaseResponse {
  @JsonKey(name: 'data')
  List<ActivityQoute>? data;
  ActivityQouteResponse({this.data}) : super(false);

  factory ActivityQouteResponse.fromJson(Map<String, dynamic> json) =>
      _$ActivityQouteResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ActivityQouteResponseToJson(this);
}
