import 'package:json_annotation/json_annotation.dart';

part 'account_party_involved.g.dart';

@JsonSerializable()
class AccountPartyInvolved {
  String? createDate;
  String? modifiedDate;
  int? status;
  String? createBy;
  String? updateBy;
  int? id;
  int? accountId;
  String? accountName;
  int? employeeId;
  int? employeeIsActive;
  String? employeeFirstName;
  String? employeeMiddleName;
  String? employeeLastName;
  int? partyInvolvedPartnerFunctionId;
  String? partyInvolvedPartnerFunctionName;
  int? isMain;
  int? employeeTitleId;
  String? employeeTitleName;

  AccountPartyInvolved({
    this.createDate,
    this.modifiedDate,
    this.status,
    this.createBy,
    this.updateBy,
    this.id,
    this.accountId,
    this.accountName,
    this.employeeId,
    this.employeeIsActive,
    this.employeeFirstName,
    this.employeeMiddleName,
    this.employeeLastName,
    this.partyInvolvedPartnerFunctionId,
    this.partyInvolvedPartnerFunctionName,
    this.employeeTitleId,
    this.employeeTitleName,
    this.isMain,
  });

  factory AccountPartyInvolved.fromJson(Map<String, dynamic> json) =>
      _$AccountPartyInvolvedFromJson(json);

  Map<String, dynamic> toJson() => _$AccountPartyInvolvedToJson(this);

  String getEmployeeFullName() {
    return '${employeeLastName ?? ''} ${employeeMiddleName ?? ''} ${employeeFirstName ?? ''}';
  }
}
