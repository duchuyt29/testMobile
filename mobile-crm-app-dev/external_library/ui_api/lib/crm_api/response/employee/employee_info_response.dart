import 'package:json_annotation/json_annotation.dart';

import '../../models/employee/employee_info.dart';
import '../base_response.dart';

part 'employee_info_response.g.dart';

@JsonSerializable()
class EmployeeInfoResponse extends BaseResponse {
  EmployeeInfo? data;

  EmployeeInfoResponse({this.data}) : super(false);

  factory EmployeeInfoResponse.fromJson(Map<String, dynamic> json) =>
      _$EmployeeInfoResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$EmployeeInfoResponseToJson(this);
}
