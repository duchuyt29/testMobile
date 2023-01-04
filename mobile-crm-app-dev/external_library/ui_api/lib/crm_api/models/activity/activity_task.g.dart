// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActivityTask _$ActivityTaskFromJson(Map<String, dynamic> json) => ActivityTask(
      objectTypeId: json['objectTypeId'] as int?,
      priorityId: json['priorityId'] as int?,
      accountId: json['accountId'] as int?,
      companyId: json['companyId'] as int?,
      createBy: json['createBy'] == null
          ? null
          : InvolveIds.fromJson(json['createBy'] as Map<String, dynamic>),
      name: json['name'] as String?,
      responsible: json['responsible'] == null
          ? null
          : InvolveIds.fromJson(json['responsible'] as Map<String, dynamic>),
      responsibleId: json['responsibleId'] as String?,
      id: json['id'] as int?,
      state: json['state'] as String?,
      deadline: json['deadline'] == null
          ? null
          : DateTime.parse(json['deadline'] as String),
      startDate: json['startDate'] == null
          ? null
          : DateTime.parse(json['startDate'] as String),
      closedOn: json['closedOn'] == null
          ? null
          : DateTime.parse(json['closedOn'] as String),
      activityTypeId: json['activityTypeId'] as int?,
      createDate: json['createDate'] == null
          ? null
          : DateTime.parse(json['createDate'] as String),
      nextStates: (json['next-states'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      opportunityId: json['opportunityId'] as int?,
      contractId: json['contractId'] as int?,
      leadId: json['leadId'] as int?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$ActivityTaskToJson(ActivityTask instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('objectTypeId', instance.objectTypeId);
  writeNotNull('priorityId', instance.priorityId);
  writeNotNull('accountId', instance.accountId);
  writeNotNull('companyId', instance.companyId);
  writeNotNull('createBy', instance.createBy);
  writeNotNull('name', instance.name);
  writeNotNull('responsible', instance.responsible);
  writeNotNull('responsibleId', instance.responsibleId);
  writeNotNull('id', instance.id);
  writeNotNull('state', instance.state);
  writeNotNull('deadline', instance.deadline?.toIso8601String());
  writeNotNull('startDate', instance.startDate?.toIso8601String());
  writeNotNull('closedOn', instance.closedOn?.toIso8601String());
  writeNotNull('activityTypeId', instance.activityTypeId);
  writeNotNull('createDate', instance.createDate?.toIso8601String());
  writeNotNull('next-states', instance.nextStates);
  writeNotNull('opportunityId', instance.opportunityId);
  writeNotNull('contractId', instance.contractId);
  writeNotNull('leadId', instance.leadId);
  writeNotNull('description', instance.description);
  return val;
}
