// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmployeeModel _$EmployeeModelFromJson(Map<String, dynamic> json) =>
    EmployeeModel(
      employeeMiddleName: json['employeeMiddleName'] as String?,
      id: json['id'] as int?,
      employeeCode: json['employeeCode'] as String?,
      employeeLastName: json['employeeLastName'] as String?,
      employeeFirstName: json['employeeFirstName'] as String?,
      userId: json['userId'] as String?,
      isAdmin: json['isAdmin'] as int?,
      employeeTitleId: json['employeeTitleId'] as int?,
      employeeTitleName: json['employeeTitleName'] as String?,
      isActive: json['isActive'] as int?,
    );

Map<String, dynamic> _$EmployeeModelToJson(EmployeeModel instance) =>
    <String, dynamic>{
      'employeeMiddleName': instance.employeeMiddleName,
      'id': instance.id,
      'employeeCode': instance.employeeCode,
      'employeeLastName': instance.employeeLastName,
      'employeeFirstName': instance.employeeFirstName,
      'userId': instance.userId,
      'isAdmin': instance.isAdmin,
      'employeeTitleId': instance.employeeTitleId,
      'employeeTitleName': instance.employeeTitleName,
      'isActive': instance.isActive,
    };
