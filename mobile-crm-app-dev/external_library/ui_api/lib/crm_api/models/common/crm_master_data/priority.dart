import 'package:json_annotation/json_annotation.dart';

part 'priority.g.dart';

@JsonSerializable()
class Priority {
  String? priorityName;
  int? id;

  Priority({this.priorityName, this.id});

  factory Priority.fromJson(Map<String, dynamic> json) {
    return _$PriorityFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PriorityToJson(this);
}
