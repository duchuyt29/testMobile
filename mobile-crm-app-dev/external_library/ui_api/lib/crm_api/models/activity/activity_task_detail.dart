import 'package:json_annotation/json_annotation.dart';

import 'activity_involves.dart';

part 'activity_task_detail.g.dart';

@JsonSerializable(includeIfNull: false)
class ActivityTaskDetail {
  DateTime? createDate;
  DateTime? modifiedDate;
  int? version;
  int? status;
  int? companyId;
  InvolveIds? createByUser;
  InvolveIds? updateByUser;
  int? id;
  int? groupId;
  int? workflowId;
  int? activityId;
  String? requestedBy;
  String? responsibleId;
  String? name;
  String? description;
  DateTime? startDate;
  DateTime? deadline;
  DateTime? closedOn;
  String? type;
  bool? important;
  bool? temp;
  String? state;
  int? parentId;
  List<dynamic>? attachments;
  int? objectTypeId;
  int? activityTypeId;
  int? priorityId;
  int? accountId;
  String? accountName;
  int? refAccountId;
  int? leadId;
  String? leadName;
  int? opportunityId;
  String? opportunityName;
  int? quoteId;
  String? quoteName;
  int? contractId;
  String? contractNumber;
  String? contractNumberInput;
  int? orderId;
  String? orderNumber;
  int? taskTypeId;
  int? contactId;
  String? contactName;
  @JsonKey(name: 'next-states', defaultValue: [])
  List<String>? nextStates;
  int? durationUnitId;
  int? duration;
  String? phoneNumber;
  String? involvedPeople;
  double? latitude;
  double? longitude;
  DateTime? checkInDate;
  String? checkInUid;
  InvolveIds? checkInByUser;

  ActivityTaskDetail({
    this.createDate,
    this.modifiedDate,
    this.version,
    this.status,
    this.companyId,
    this.createByUser,
    this.updateByUser,
    this.id,
    this.groupId,
    this.workflowId,
    this.activityId,
    this.requestedBy,
    this.responsibleId,
    this.name,
    this.description,
    this.startDate,
    this.deadline,
    this.closedOn,
    this.type,
    this.important,
    this.temp,
    this.state,
    this.parentId,
    this.attachments,
    this.objectTypeId,
    this.activityTypeId,
    this.accountId,
    this.accountName,
    this.refAccountId,
    this.priorityId,
    this.contractId,
    this.leadId,
    this.leadName,
    this.opportunityId,
    this.opportunityName,
    this.quoteId,
    this.quoteName,
    this.orderId,
    this.orderNumber,
    this.contractNumber,
    this.contractNumberInput,
    this.taskTypeId,
    this.contactId,
    this.contactName,
    this.nextStates,
    this.phoneNumber,
    this.duration,
    this.durationUnitId,
    this.involvedPeople,
    this.latitude,
    this.longitude,
    this.checkInUid,
    this.checkInDate,
    this.checkInByUser,
  });

  factory ActivityTaskDetail.fromJson(Map<String, dynamic> json) =>
      _$ActivityTaskDetailFromJson(json);

  Map<String, dynamic> toJson() => _$ActivityTaskDetailToJson(this);
}
