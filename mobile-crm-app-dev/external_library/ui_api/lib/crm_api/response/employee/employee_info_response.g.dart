// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_info_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmployeeInfoResponse _$EmployeeInfoResponseFromJson(
        Map<String, dynamic> json) =>
    EmployeeInfoResponse(
      data: json['data'] == null
          ? null
          : EmployeeInfo.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..code = json['code'] as String?
      ..success = json['success'] as bool? ?? false
      ..title = json['title'] as String?
      ..message = json['message'] as String?;

Map<String, dynamic> _$EmployeeInfoResponseToJson(
        EmployeeInfoResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'success': instance.success,
      'title': instance.title,
      'message': instance.message,
      'data': instance.data,
    };
