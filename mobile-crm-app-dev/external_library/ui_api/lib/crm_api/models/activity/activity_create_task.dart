import 'package:json_annotation/json_annotation.dart';

part 'activity_create_task.g.dart';

@JsonSerializable(includeIfNull: false)
class ActivityCreateTask {
  String type;
  int? activityTypeId;
  String? name;
  int? priorityId;
  int? objectTypeId;
  String? startDate;
  String? deadline;
  String? closeDate;
  int? taskTypeId;
  int? contactId;
  String? phoneNumber;
  String? involvedPeople;
  String? duration;
  int? durationUnitId;
  String? description;

  int? accountId;
  int? leadId;
  int? opportunityId;
  int? quoteId;
  int? contractId;
  int? orderId;

  ActivityCreateTask({
    this.type = 'TASK',
    this.activityTypeId,
    this.name,
    this.priorityId,
    this.objectTypeId,
    this.startDate,
    this.deadline,
    this.closeDate,
    this.taskTypeId,
    this.contactId,
    this.phoneNumber,
    this.involvedPeople,
    this.duration,
    this.durationUnitId,
    this.description,
    this.accountId,
    this.leadId,
    this.opportunityId,
    this.quoteId,
    this.contractId,
    this.orderId,
  });

  factory ActivityCreateTask.fromJson(Map<String, dynamic> json) =>
      _$ActivityCreateTaskFromJson(json);

  Map<String, dynamic> toJson() => _$ActivityCreateTaskToJson(this);
}
