import 'package:json_annotation/json_annotation.dart';

import '../../models/employee/employee_model.dart';
import '../base_response.dart';

part 'employees_response.g.dart';

@JsonSerializable()
class EmployeesResponse extends BaseResponse {
  @JsonKey(name: 'data')
  List<EmployeeModel>? data;

  EmployeesResponse({this.data}) : super(false);

  factory EmployeesResponse.fromJson(Map<String, dynamic> json) =>
      _$EmployeesResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$EmployeesResponseToJson(this);
}
