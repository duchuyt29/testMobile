import 'package:json_annotation/json_annotation.dart';

import '../../models/auth/employee_info_hcm.dart';
import '../base_response.dart';

part 'employee_info_hcm_response.g.dart';

@JsonSerializable()
class EmployeeInfoHCMResponse extends BaseResponse {
  EmployeeDataHCM? data;

  EmployeeInfoHCMResponse({this.data}) : super(false);

  factory EmployeeInfoHCMResponse.fromJson(Map<String, dynamic> json) =>
      _$EmployeeInfoHCMResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$EmployeeInfoHCMResponseToJson(this);
}
