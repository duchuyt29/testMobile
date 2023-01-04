// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_info_hcm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmployeeInfoHCM _$EmployeeInfoHCMFromJson(Map<String, dynamic> json) =>
    EmployeeInfoHCM(
      id: json['id'] as int?,
      fullName: json['fullName'] as String?,
      birthDate: json['birthDate'] == null
          ? null
          : DateTime.parse(json['birthDate'] as String),
      gender: json['gender'] as String?,
      mobile: json['mobile'] as String?,
      email: json['email'] as String?,
      avatar: json['avatar'],
      status: json['status'] as int?,
    );

Map<String, dynamic> _$EmployeeInfoHCMToJson(EmployeeInfoHCM instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fullName': instance.fullName,
      'birthDate': instance.birthDate?.toIso8601String(),
      'gender': instance.gender,
      'mobile': instance.mobile,
      'email': instance.email,
      'avatar': instance.avatar,
      'status': instance.status,
    };

EmployeeDataHCM _$EmployeeDataHCMFromJson(Map<String, dynamic> json) =>
    EmployeeDataHCM(
      employeeInfoHCM: json['person'] == null
          ? null
          : EmployeeInfoHCM.fromJson(json['person'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EmployeeDataHCMToJson(EmployeeDataHCM instance) =>
    <String, dynamic>{
      'person': instance.employeeInfoHCM,
    };
