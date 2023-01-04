import 'package:json_annotation/json_annotation.dart';

import 'activity_involves.dart';
import 'activity_task.dart';

part 'activity_content.g.dart';

@JsonSerializable(includeIfNull: false)
class ActivityContent {
  ActivityTask? task;
  List<ActivityInvolves>? involves;

  ActivityContent({
    this.task,
    this.involves,
  });

  factory ActivityContent.fromJson(Map<String, dynamic> json) =>
      _$ActivityContentFromJson(json);

  Map<String, dynamic> toJson() => _$ActivityContentToJson(this);
}
