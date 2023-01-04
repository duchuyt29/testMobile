import 'package:json_annotation/json_annotation.dart';

part 'employee_info_hcm.g.dart';

@JsonSerializable()
class EmployeeInfoHCM {
  int? id;
  String? fullName;
  DateTime? birthDate;
  String? gender;
  String? mobile;
  String? email;
  dynamic avatar;
  int? status;

  EmployeeInfoHCM({
    this.id,
    this.fullName,
    this.birthDate,
    this.gender,
    this.mobile,
    this.email,
    this.avatar,
    this.status,
  });

  factory EmployeeInfoHCM.fromJson(Map<String, dynamic> json) {
    return _$EmployeeInfoHCMFromJson(json);
  }

  Map<String, dynamic> toJson() => _$EmployeeInfoHCMToJson(this);
}

@JsonSerializable()
class EmployeeDataHCM {
  @JsonKey(name: 'person')
  EmployeeInfoHCM? employeeInfoHCM;

  EmployeeDataHCM({this.employeeInfoHCM});

  factory EmployeeDataHCM.fromJson(Map<String, dynamic> json) {
    return _$EmployeeDataHCMFromJson(json);
  }

  Map<String, dynamic> toJson() => _$EmployeeDataHCMToJson(this);
}
