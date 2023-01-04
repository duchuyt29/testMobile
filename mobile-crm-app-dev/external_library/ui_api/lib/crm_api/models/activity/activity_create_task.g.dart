// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_create_task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActivityCreateTask _$ActivityCreateTaskFromJson(Map<String, dynamic> json) =>
    ActivityCreateTask(
      type: json['type'] as String? ?? 'TASK',
      activityTypeId: json['activityTypeId'] as int?,
      name: json['name'] as String?,
      priorityId: json['priorityId'] as int?,
      objectTypeId: json['objectTypeId'] as int?,
      startDate: json['startDate'] as String?,
      deadline: json['deadline'] as String?,
      closeDate: json['closeDate'] as String?,
      taskTypeId: json['taskTypeId'] as int?,
      contactId: json['contactId'] as int?,
      phoneNumber: json['phoneNumber'] as String?,
      involvedPeople: json['involvedPeople'] as String?,
      duration: json['duration'] as String?,
      durationUnitId: json['durationUnitId'] as int?,
      description: json['description'] as String?,
      accountId: json['accountId'] as int?,
      leadId: json['leadId'] as int?,
      opportunityId: json['opportunityId'] as int?,
      quoteId: json['quoteId'] as int?,
      contractId: json['contractId'] as int?,
      orderId: json['orderId'] as int?,
    );

Map<String, dynamic> _$ActivityCreateTaskToJson(ActivityCreateTask instance) {
  final val = <String, dynamic>{
    'type': instance.type,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('activityTypeId', instance.activityTypeId);
  writeNotNull('name', instance.name);
  writeNotNull('priorityId', instance.priorityId);
  writeNotNull('objectTypeId', instance.objectTypeId);
  writeNotNull('startDate', instance.startDate);
  writeNotNull('deadline', instance.deadline);
  writeNotNull('closeDate', instance.closeDate);
  writeNotNull('taskTypeId', instance.taskTypeId);
  writeNotNull('contactId', instance.contactId);
  writeNotNull('phoneNumber', instance.phoneNumber);
  writeNotNull('involvedPeople', instance.involvedPeople);
  writeNotNull('duration', instance.duration);
  writeNotNull('durationUnitId', instance.durationUnitId);
  writeNotNull('description', instance.description);
  writeNotNull('accountId', instance.accountId);
  writeNotNull('leadId', instance.leadId);
  writeNotNull('opportunityId', instance.opportunityId);
  writeNotNull('quoteId', instance.quoteId);
  writeNotNull('contractId', instance.contractId);
  writeNotNull('orderId', instance.orderId);
  return val;
}
