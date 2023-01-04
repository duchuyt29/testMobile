// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lead_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LeadModel _$LeadModelFromJson(Map<String, dynamic> json) => LeadModel(
      createDate: json['createDate'] == null
          ? null
          : DateTime.parse(json['createDate'] as String),
      modifiedDate: json['modifiedDate'] == null
          ? null
          : DateTime.parse(json['modifiedDate'] as String),
      status: json['status'] as int?,
      createBy: json['createBy'] as String?,
      updateBy: json['updateBy'] as String?,
      id: json['id'] as int?,
      employeeId: json['employeeId'] as int?,
      leadCode: json['leadCode'] as String?,
      leadName: json['leadName'] as String?,
      leadEmail: json['leadEmail'] as String?,
      leadPhone: json['leadPhone'] as String?,
      employeeFirstName: json['employeeFirstName'] as String?,
      employeeLastName: json['employeeLastName'] as String?,
      employeeMiddleName: json['employeeMiddleName'] as String?,
      leadPotentialLevelId: json['leadPotentialLevelId'] as int?,
      leadPotentialLevelName: json['leadPotentialLevelName'] as String?,
      isConvert: json['isConvert'] as int?,
      leadStageId: json['leadStageId'] as int?,
    );

Map<String, dynamic> _$LeadModelToJson(LeadModel instance) => <String, dynamic>{
      'createDate': instance.createDate?.toIso8601String(),
      'modifiedDate': instance.modifiedDate?.toIso8601String(),
      'status': instance.status,
      'createBy': instance.createBy,
      'updateBy': instance.updateBy,
      'id': instance.id,
      'employeeId': instance.employeeId,
      'leadCode': instance.leadCode,
      'leadName': instance.leadName,
      'leadEmail': instance.leadEmail,
      'leadPhone': instance.leadPhone,
      'employeeFirstName': instance.employeeFirstName,
      'employeeLastName': instance.employeeLastName,
      'employeeMiddleName': instance.employeeMiddleName,
      'leadPotentialLevelId': instance.leadPotentialLevelId,
      'leadPotentialLevelName': instance.leadPotentialLevelName,
      'isConvert': instance.isConvert,
      'leadStageId': instance.leadStageId,
    };
