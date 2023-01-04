import 'package:json_annotation/json_annotation.dart';

import '../models/activity/activity_create_involve.dart';
import '../models/activity/activity_create_task.dart';
import '../models/activity/activity_task_detail.dart';
import 'activity_create_request.dart';

part 'activity_edit_request.g.dart';

@JsonSerializable()
class ActivityEditRequest {
  ActivityCreateTask? task;
  List<ActivityCreateInvolve>? involves;

  ActivityEditRequest({
    this.task,
    this.involves,
  });

  factory ActivityEditRequest.fromJson(Map<String, dynamic> json) =>
      _$ActivityEditRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ActivityEditRequestToJson(this);
}
