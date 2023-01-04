import 'package:json_annotation/json_annotation.dart';
import 'package:sicix/shared/utils/date_util.dart';

part 'contact_party_involved.g.dart';

@JsonSerializable()
class ContactPartyInvolved {
  @JsonKey(toJson: _dateToString)
  DateTime? createDate;
  @JsonKey(toJson: _dateToString)
  DateTime? modifiedDate;
  int? status;
  String? createBy;
  String? updateBy;
  int? id;
  int? contactId;
  String? contactName;
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

  ContactPartyInvolved({
    this.createDate,
    this.modifiedDate,
    this.status,
    this.createBy,
    this.updateBy,
    this.id,
    this.contactId,
    this.contactName,
    this.employeeId,
    this.employeeIsActive,
    this.employeeFirstName,
    this.employeeMiddleName,
    this.employeeLastName,
    this.partyInvolvedPartnerFunctionId,
    this.partyInvolvedPartnerFunctionName,
    this.isMain,
    this.employeeTitleId,
    this.employeeTitleName,
  });

  factory ContactPartyInvolved.fromJson(Map<String, dynamic> json) =>
      _$ContactPartyInvolvedFromJson(json);

  Map<String, dynamic> toJson() => _$ContactPartyInvolvedToJson(this);

  String getEmployeeFullName() {
    return '${employeeLastName ?? ''} ${employeeMiddleName ?? ''} ${employeeFirstName ?? ''}';
  }
}

String? _dateToString(DateTime? date) {
  // return date?.toUtc().toString() ?? '';
  if (date == null) {
    return null;
  }
  return DateUtil.formatDatetimeToString(date.toUtc(), type: DateUtil.API_TYPE);
}
