import 'package:json_annotation/json_annotation.dart';

import '../../models/activity/activity_account.dart';
import '../../models/activity/activity_content.dart';
import '../../models/activity/activity_lead.dart';
import '../../models/base_models.dart';
import '../base_response.dart';

part 'activity_lead_response.g.dart';

@JsonSerializable()
class ActivityLeadResponse extends BaseResponse {
  @JsonKey(name: 'data')
  List<ActivityLead>? data;
  ActivityLeadResponse({this.data}) : super(false);

  factory ActivityLeadResponse.fromJson(Map<String, dynamic> json) =>
      _$ActivityLeadResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ActivityLeadResponseToJson(this);
}
