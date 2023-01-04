// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_task_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActivityTaskDetail _$ActivityTaskDetailFromJson(Map<String, dynamic> json) =>
    ActivityTaskDetail(
      createDate: json['createDate'] == null
          ? null
          : DateTime.parse(json['createDate'] as String),
      modifiedDate: json['modifiedDate'] == null
          ? null
          : DateTime.parse(json['modifiedDate'] as String),
      version: json['version'] as int?,
      status: json['status'] as int?,
      companyId: json['companyId'] as int?,
      createByUser: json['createByUser'] == null
          ? null
          : InvolveIds.fromJson(json['createByUser'] as Map<String, dynamic>),
      updateByUser: json['updateByUser'] == null
          ? null
          : InvolveIds.fromJson(json['updateByUser'] as Map<String, dynamic>),
      id: json['id'] as int?,
      groupId: json['groupId'] as int?,
      workflowId: json['workflowId'] as int?,
      activityId: json['activityId'] as int?,
      requestedBy: json['requestedBy'] as String?,
      responsibleId: json['responsibleId'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      startDate: json['startDate'] == null
          ? null
          : DateTime.parse(json['startDate'] as String),
      deadline: json['deadline'] == null
          ? null
          : DateTime.parse(json['deadline'] as String),
      closedOn: json['closedOn'] == null
          ? null
          : DateTime.parse(json['closedOn'] as String),
      type: json['type'] as String?,
      important: json['important'] as bool?,
      temp: json['temp'] as bool?,
      state: json['state'] as String?,
      parentId: json['parentId'] as int?,
      attachments: json['attachments'] as List<dynamic>?,
      objectTypeId: json['objectTypeId'] as int?,
      activityTypeId: json['activityTypeId'] as int?,
      accountId: json['accountId'] as int?,
      accountName: json['accountName'] as String?,
      refAccountId: json['refAccountId'] as int?,
      priorityId: json['priorityId'] as int?,
      contractId: json['contractId'] as int?,
      leadId: json['leadId'] as int?,
      leadName: json['leadName'] as String?,
      opportunityId: json['opportunityId'] as int?,
      opportunityName: json['opportunityName'] as String?,
      quoteId: json['quoteId'] as int?,
      quoteName: json['quoteName'] as String?,
      orderId: json['orderId'] as int?,
      orderNumber: json['orderNumber'] as String?,
      contractNumber: json['contractNumber'] as String?,
      contractNumberInput: json['contractNumberInput'] as String?,
      taskTypeId: json['taskTypeId'] as int?,
      contactId: json['contactId'] as int?,
      contactName: json['contactName'] as String?,
      nextStates: (json['next-states'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      phoneNumber: json['phoneNumber'] as String?,
      duration: json['duration'] as int?,
      durationUnitId: json['durationUnitId'] as int?,
      involvedPeople: json['involvedPeople'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      checkInUid: json['checkInUid'] as String?,
      checkInDate: json['checkInDate'] == null
          ? null
          : DateTime.parse(json['checkInDate'] as String),
      checkInByUser: json['checkInByUser'] == null
          ? null
          : InvolveIds.fromJson(json['checkInByUser'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ActivityTaskDetailToJson(ActivityTaskDetail instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('createDate', instance.createDate?.toIso8601String());
  writeNotNull('modifiedDate', instance.modifiedDate?.toIso8601String());
  writeNotNull('version', instance.version);
  writeNotNull('status', instance.status);
  writeNotNull('companyId', instance.companyId);
  writeNotNull('createByUser', instance.createByUser);
  writeNotNull('updateByUser', instance.updateByUser);
  writeNotNull('id', instance.id);
  writeNotNull('groupId', instance.groupId);
  writeNotNull('workflowId', instance.workflowId);
  writeNotNull('activityId', instance.activityId);
  writeNotNull('requestedBy', instance.requestedBy);
  writeNotNull('responsibleId', instance.responsibleId);
  writeNotNull('name', instance.name);
  writeNotNull('description', instance.description);
  writeNotNull('startDate', instance.startDate?.toIso8601String());
  writeNotNull('deadline', instance.deadline?.toIso8601String());
  writeNotNull('closedOn', instance.closedOn?.toIso8601String());
  writeNotNull('type', instance.type);
  writeNotNull('important', instance.important);
  writeNotNull('temp', instance.temp);
  writeNotNull('state', instance.state);
  writeNotNull('parentId', instance.parentId);
  writeNotNull('attachments', instance.attachments);
  writeNotNull('objectTypeId', instance.objectTypeId);
  writeNotNull('activityTypeId', instance.activityTypeId);
  writeNotNull('priorityId', instance.priorityId);
  writeNotNull('accountId', instance.accountId);
  writeNotNull('accountName', instance.accountName);
  writeNotNull('refAccountId', instance.refAccountId);
  writeNotNull('leadId', instance.leadId);
  writeNotNull('leadName', instance.leadName);
  writeNotNull('opportunityId', instance.opportunityId);
  writeNotNull('opportunityName', instance.opportunityName);
  writeNotNull('quoteId', instance.quoteId);
  writeNotNull('quoteName', instance.quoteName);
  writeNotNull('contractId', instance.contractId);
  writeNotNull('contractNumber', instance.contractNumber);
  writeNotNull('contractNumberInput', instance.contractNumberInput);
  writeNotNull('orderId', instance.orderId);
  writeNotNull('orderNumber', instance.orderNumber);
  writeNotNull('taskTypeId', instance.taskTypeId);
  writeNotNull('contactId', instance.contactId);
  writeNotNull('contactName', instance.contactName);
  writeNotNull('next-states', instance.nextStates);
  writeNotNull('durationUnitId', instance.durationUnitId);
  writeNotNull('duration', instance.duration);
  writeNotNull('phoneNumber', instance.phoneNumber);
  writeNotNull('involvedPeople', instance.involvedPeople);
  writeNotNull('latitude', instance.latitude);
  writeNotNull('longitude', instance.longitude);
  writeNotNull('checkInDate', instance.checkInDate?.toIso8601String());
  writeNotNull('checkInUid', instance.checkInUid);
  writeNotNull('checkInByUser', instance.checkInByUser);
  return val;
}
