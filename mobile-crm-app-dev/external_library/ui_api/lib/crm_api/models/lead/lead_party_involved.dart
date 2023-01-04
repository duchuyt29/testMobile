import 'package:get/get.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:sicix/data/app_data_global.dart';

import '../common/crm_master_data/party_involved_partner_function.dart';
import '../employee/employee_model.dart';

part 'lead_party_involved.g.dart';

@JsonSerializable()
class LeadPartyInvolved {
  String? createDate;
  String? modifiedDate;
  int? status;
  String? createBy;
  String? updateBy;
  int? id;
  int? leadId;
  int? opportunityId;
  int? quoteId;
  int? contractId;
  int? orderId;
  int? objectTypeId;
  int? employeeId;
  int? partyInvolvedPartnerFunctionId;
  int? isMain;
  int? authorizationGroupId;

  LeadPartyInvolved({
    this.createDate,
    this.modifiedDate,
    this.status,
    this.createBy,
    this.updateBy,
    this.id,
    this.leadId,
    this.opportunityId,
    this.quoteId,
    this.contractId,
    this.orderId,
    this.objectTypeId,
    this.employeeId,
    this.partyInvolvedPartnerFunctionId,
    this.isMain,
    this.authorizationGroupId,
  });

  factory LeadPartyInvolved.fromJson(Map<String, dynamic> json) =>
      _$LeadPartyInvolvedFromJson(json);

  Map<String, dynamic> toJson() => _$LeadPartyInvolvedToJson(this);

  EmployeeModel? getEmplpoyee() {
    return AppDataGlobal.employees
        .firstWhereOrNull((element) => element.id == employeeId);
  }

  PartyInvolvedPartnerFunction? getPartyInvolvedPartnerFunction() {
    return AppDataGlobal.crmMasterData?.listPartyInvolvedPartnerFunction
        ?.firstWhereOrNull(
            (element) => element.id == partyInvolvedPartnerFunctionId);
  }
}
