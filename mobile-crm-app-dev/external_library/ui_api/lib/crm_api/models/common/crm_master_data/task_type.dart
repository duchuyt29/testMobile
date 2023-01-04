import 'package:json_annotation/json_annotation.dart';

part 'task_type.g.dart';

@JsonSerializable()
class TaskType {
  String? taskTypeName;
  int? id;
  int? status;

  TaskType({this.taskTypeName, this.id, this.status});

  factory TaskType.fromJson(Map<String, dynamic> json) {
    return _$TaskTypeFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TaskTypeToJson(this);
}
