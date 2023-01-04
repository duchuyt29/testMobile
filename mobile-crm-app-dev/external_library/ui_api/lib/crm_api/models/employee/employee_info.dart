// ignore_for_file: lines_longer_than_80_chars

import 'package:json_annotation/json_annotation.dart';
import 'package:sicix/shared/utils/app_util.dart';

part 'employee_info.g.dart';

@JsonSerializable()
class EmployeeInfo {
  String? createDate;
  String? modifiedDate;
  int? status;
  String? createBy;
  String? updateBy;
  int? id;
  String? employeeAvatarId;
  String? employeeCode;
  String? employeeFirstName;
  String? employeeLastName;
  String? employeeMiddleName;
  String? employeeEmail;
  String? employeePhone;
  int? employeeTitleId;
  String? employeeTitleName;
  String? employeeContractId;
  String? employeeContractName;
  int? organizationId;
  String? organizationName;
  String? userId;
  String? username;
  String? employeeCountryId;
  String? employeeCountryName;
  String? employeeDistrictId;
  String? employeeDistrictName;
  String? employeeProvinceId;
  String? employeeProvinceName;
  String? employeePostalCode;
  String? employeeStreet;
  String? employeeCountryTimeZoneId;
  String? employeeCountryTimeZoneName;
  String? employeeCountryTimeZoneText;
  String? employeeLanguageId;
  String? employeeLanguageName;
  int? isAdmin;
  int? isActive;
  String? totalUsed;
  @JsonKey(name: 'authorGroupEmployeeDTOS')
  List<dynamic>? authorGroupEmployeeDtos;
  String? employeeSubTitle;
  int? employeeLevelId;
  List<int>? allowEmployeeIds;

  EmployeeInfo({
    this.createDate,
    this.modifiedDate,
    this.status,
    this.createBy,
    this.updateBy,
    this.id,
    this.employeeAvatarId,
    this.employeeCode,
    this.employeeFirstName,
    this.employeeLastName,
    this.employeeMiddleName,
    this.employeeEmail,
    this.employeePhone,
    this.employeeTitleId,
    this.employeeTitleName,
    this.employeeContractId,
    this.employeeContractName,
    this.organizationId,
    this.organizationName,
    this.userId,
    this.username,
    this.employeeCountryId,
    this.employeeCountryName,
    this.employeeDistrictId,
    this.employeeDistrictName,
    this.employeeProvinceId,
    this.employeeProvinceName,
    this.employeePostalCode,
    this.employeeStreet,
    this.employeeCountryTimeZoneId,
    this.employeeCountryTimeZoneName,
    this.employeeCountryTimeZoneText,
    this.employeeLanguageId,
    this.employeeLanguageName,
    this.isAdmin,
    this.isActive,
    this.totalUsed,
    this.authorGroupEmployeeDtos,
    this.employeeSubTitle,
    this.employeeLevelId,
    this.allowEmployeeIds,
  });

  factory EmployeeInfo.fromJson(Map<String, dynamic> json) {
    return _$EmployeeInfoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$EmployeeInfoToJson(this);

  String getFullName() {
    return AppUtil.cleanDuplicateWhitespace(
        '${employeeFirstName ?? ''} ${employeeMiddleName ?? ''} ${employeeLastName ?? ''}');
  }
}
