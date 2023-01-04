import 'package:json_annotation/json_annotation.dart';

import '../../models/activity/activity_content.dart';
import '../../models/activity/activity_involves.dart';
import '../../models/activity/activity_task_detail.dart';
import '../base_response.dart';

part 'activity_update_state_response.g.dart';

@JsonSerializable()
class ActivityUpdateStateResponse extends BaseResponse {
  @JsonKey(name: 'data')
  ActivityUpdateStateData? data;
  ActivityUpdateStateResponse({this.data}) : super(false);

  factory ActivityUpdateStateResponse.fromJson(Map<String, dynamic> json) =>
      _$ActivityUpdateStateResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ActivityUpdateStateResponseToJson(this);
}

@JsonSerializable(includeIfNull: false)
class ActivityUpdateStateData {
  ActivityTaskDetail? task;

  ActivityUpdateStateData({
    this.task,
  });

  factory ActivityUpdateStateData.fromJson(Map<String, dynamic> json) =>
      _$ActivityUpdateStateDataFromJson(json);

  Map<String, dynamic> toJson() => _$ActivityUpdateStateDataToJson(this);
}
