import 'package:json_annotation/json_annotation.dart';

import '../models/activity/activity_create_involve.dart';
import '../models/activity/activity_create_task.dart';

part 'activity_create_request.g.dart';

@JsonSerializable()
class ActivityCreateRequest {
  ActivityCreateTask? task;
  List<ActivityCreateInvolve>? involves;

  ActivityCreateRequest({
    this.task,
    this.involves,
  });

  factory ActivityCreateRequest.fromJson(Map<String, dynamic> json) =>
      _$ActivityCreateRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ActivityCreateRequestToJson(this);
}
