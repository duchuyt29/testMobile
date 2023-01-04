import 'package:json_annotation/json_annotation.dart';

import 'activity_involves.dart';

part 'activity_task.g.dart';

@JsonSerializable(includeIfNull: false)
class ActivityTask {
  int? objectTypeId;
  int? priorityId;
  int? accountId;
  int? companyId;
  InvolveIds? createBy;
  String? name;
  InvolveIds? responsible;
  String? responsibleId;
  int? id;
  String? state;
  DateTime? deadline;
  DateTime? startDate;
  DateTime? closedOn;
  int? activityTypeId;
  DateTime? createDate;
  @JsonKey(name: 'next-states', defaultValue: [])
  List<String>? nextStates;
  int? opportunityId;
  int? contractId;
  int? leadId;
  String? description;

  ActivityTask({
    this.objectTypeId,
    this.priorityId,
    this.accountId,
    this.companyId,
    this.createBy,
    this.name,
    this.responsible,
    this.responsibleId,
    this.id,
    this.state,
    this.deadline,
    this.startDate,
    this.closedOn,
    this.activityTypeId,
    this.createDate,
    this.nextStates,
    this.opportunityId,
    this.contractId,
    this.leadId,
    this.description,
  });

  factory ActivityTask.fromJson(Map<String, dynamic> json) =>
      _$ActivityTaskFromJson(json);

  Map<String, dynamic> toJson() => _$ActivityTaskToJson(this);
}
