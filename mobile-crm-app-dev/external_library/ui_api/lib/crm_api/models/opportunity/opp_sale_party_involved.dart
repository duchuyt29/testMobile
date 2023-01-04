import 'package:json_annotation/json_annotation.dart';
import 'package:sicix/data/app_data_global.dart';

part 'opp_sale_party_involved.g.dart';

@JsonSerializable()
class OppSalePartyInvolved {
  String? createDate;
  String? modifiedDate;
  int? status;
  String? createBy;
  String? updateBy;
  int? id;
  int? opportunityId;
  int? objectTypeId;
  int? employeeId;
  int? isMain;
  String? employeeFirstName;
  String? employeeLastName;
  String? employeeMiddleName;
  String? employeeTitleName;
  int? employeeTitleId;
  int? partyInvolvedPartnerFunctionId;

  OppSalePartyInvolved(
      {this.createDate,
      this.modifiedDate,
      this.status,
      this.createBy,
      this.updateBy,
      this.id,
      this.opportunityId,
      this.objectTypeId,
      this.employeeId,
      this.isMain,
      this.employeeFirstName,
      this.employeeLastName,
      this.employeeMiddleName,
      this.employeeTitleName,
      this.employeeTitleId,
      this.partyInvolvedPartnerFunctionId});

  factory OppSalePartyInvolved.fromJson(Map<String, dynamic> json) =>
      _$OppSalePartyInvolvedFromJson(json);

  Map<String, dynamic> toJson() => _$OppSalePartyInvolvedToJson(this);

  String getInvolvedPartnerFunctionName() {
    if (partyInvolvedPartnerFunctionId != null) {
      return AppDataGlobal.crmMasterData!.listPartyInvolvedPartnerFunction!
          .firstWhere((element) => element.id == partyInvolvedPartnerFunctionId)
          .partyInvolvedPartnerFunctionName!;
    }
    return '';
  }

  String getEmployeeFullName() {
    return '${employeeLastName ?? ''} ${employeeMiddleName ?? ''} ${employeeFirstName ?? ''}';
  }
}
