import 'package:json_annotation/json_annotation.dart';

import '../../models/activity/activity_content.dart';
import '../../models/activity/activity_involves.dart';
import '../../models/activity/activity_task_detail.dart';
import '../base_response.dart';

part 'activity_detail_response.g.dart';

@JsonSerializable()
class ActivityDetailResponse extends BaseResponse {
  @JsonKey(name: 'data')
  ActivityDetailData? data;
  ActivityDetailResponse({this.data}) : super(false);

  factory ActivityDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$ActivityDetailResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ActivityDetailResponseToJson(this);
}

@JsonSerializable(includeIfNull: false)
class ActivityDetailData {
  ActivityTaskDetail? task;
  List<ActivityInvolves>? involves;

  ActivityDetailData({
    this.task,
    this.involves,
  });

  factory ActivityDetailData.fromJson(Map<String, dynamic> json) =>
      _$ActivityDetailDataFromJson(json);

  Map<String, dynamic> toJson() => _$ActivityDetailDataToJson(this);
}
