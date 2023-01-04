// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employees_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmployeesResponse _$EmployeesResponseFromJson(Map<String, dynamic> json) =>
    EmployeesResponse(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => EmployeeModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..code = json['code'] as String?
      ..success = json['success'] as bool? ?? false
      ..title = json['title'] as String?
      ..message = json['message'] as String?;

Map<String, dynamic> _$EmployeesResponseToJson(EmployeesResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'success': instance.success,
      'title': instance.title,
      'message': instance.message,
      'data': instance.data,
    };
