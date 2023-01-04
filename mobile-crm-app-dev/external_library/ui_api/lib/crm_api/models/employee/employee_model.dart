import 'package:json_annotation/json_annotation.dart';
import 'package:sicix/shared/utils/app_util.dart';
import 'package:tiengviet/tiengviet.dart';

part 'employee_model.g.dart';

@JsonSerializable()
class EmployeeModel {
  String? employeeMiddleName;
  int? id;
  String? employeeCode;
  String? employeeLastName;
  String? employeeFirstName;
  String? userId;
  int? isAdmin;
  int? employeeTitleId;
  String? employeeTitleName;
  int? isActive;

  EmployeeModel({
    this.employeeMiddleName,
    this.id,
    this.employeeCode,
    this.employeeLastName,
    this.employeeFirstName,
    this.userId,
    this.isAdmin,
    this.employeeTitleId,
    this.employeeTitleName,
    this.isActive,
  });

  factory EmployeeModel.fromJson(Map<String, dynamic> json) {
    return _$EmployeeModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$EmployeeModelToJson(this);

  String getFullname() {
    return AppUtil.cleanDuplicateWhitespace(
        '${employeeLastName ?? ''} ${employeeMiddleName ?? ''} ${employeeFirstName ?? ''}');
  }

  bool isCompare(String searchText) {
    return TiengViet.parse(getFullname())
            .toLowerCase()
            .contains(TiengViet.parse(searchText).toLowerCase()) ||
        TiengViet.parse(employeeCode ?? '')
            .toLowerCase()
            .contains(TiengViet.parse(searchText).toLowerCase());
  }
}
