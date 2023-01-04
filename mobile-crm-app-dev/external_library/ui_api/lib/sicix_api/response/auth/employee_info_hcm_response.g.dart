// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_info_hcm_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmployeeInfoHCMResponse _$EmployeeInfoHCMResponseFromJson(
        Map<String, dynamic> json) =>
    EmployeeInfoHCMResponse(
      data: json['data'] == null
          ? null
          : EmployeeDataHCM.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..code = json['code'] as String?
      ..success = json['success'] as bool? ?? false
      ..title = json['title'] as String?
      ..message = json['message'] as String?;

Map<String, dynamic> _$EmployeeInfoHCMResponseToJson(
        EmployeeInfoHCMResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'success': instance.success,
      'title': instance.title,
      'message': instance.message,
      'data': instance.data,
    };
