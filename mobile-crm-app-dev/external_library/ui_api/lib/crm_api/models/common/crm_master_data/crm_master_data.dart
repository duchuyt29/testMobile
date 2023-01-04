import 'package:json_annotation/json_annotation.dart';
import 'package:ui_api/crm_api/models/common/crm_master_data/document_type.dart';

import 'account_address_type.dart';
import 'account_relation_type.dart';
import 'account_type.dart';
import 'country.dart';
import 'currency_exchange_rate.dart';
import 'duration_unit.dart';
import 'gender.dart';
import 'industry.dart';
import 'lead_potential_level.dart';
import 'lead_source.dart';
import 'lead_stage.dart';
import 'opportunity_stage.dart';
import 'opportunity_type.dart';
import 'party_involved_partner_function.dart';
import 'price.dart';
import 'priority.dart';
import 'salutation.dart';
import 'task_type.dart';

part 'crm_master_data.g.dart';

@JsonSerializable()
class CrmMasterData {
  List<AccountType>? listAccountType;
  List<Gender>? listGender;
  List<Industry>? listIndustry;
  List<AccountAddressType>? listAccountAddressType;
  List<Country>? listCountry;
  List<Salutation>? listSalutation;
  List<AccountRelationType>? listAccountRelationType;
  List<LeadPotentialLevel>? listLeadPotentialLevel;
  List<LeadStage>? listLeadStage;
  List<OpportunityStage>? listOpportunityStage;
  List<CurrencyExchangeRate>? listCurrencyExchangeRate;
  List<Priority>? listPriority;
  List<DurationUnit>? listDurationUnit;
  List<PartyInvolvedPartnerFunction>? listPartyInvolvedPartnerFunction;
  List<DocumentType>? listDocumentType;
  List<TaskType>? taskType;
  @JsonKey(name: 'leadSource')
  List<LeadSource>? leadSources;
  List<OpportunityType>? opportunityType;
  List<Price>? listPrice;

  CrmMasterData({
    this.listAccountType,
    this.listGender,
    this.listIndustry,
    this.listAccountAddressType,
    this.listCountry,
    this.listSalutation,
    this.listAccountRelationType,
    this.listLeadPotentialLevel,
    this.listLeadStage,
    this.listOpportunityStage,
    this.listCurrencyExchangeRate,
    this.listPriority,
    this.listDurationUnit,
    this.listPartyInvolvedPartnerFunction,
    this.listDocumentType,
    this.taskType,
    this.leadSources,
    this.opportunityType,
    this.listPrice,
  });

  factory CrmMasterData.fromJson(Map<String, dynamic> json) =>
      _$CrmMasterDataFromJson(json);

  Map<String, dynamic> toJson() => _$CrmMasterDataToJson(this);

  String getGenderName(int id) {
    var name = '';
    if (id != 0) {
      final item = listGender?.firstWhere((e) => e.id == id);
      name = item != null ? (item.genderName ?? '') : '';
    }
    return name;
  }

  String getAccountTypeName(int id) {
    var name = '';
    if (id != 0) {
      final item = listAccountType?.firstWhere((e) => e.id == id);
      name = item != null ? (item.accountTypeName ?? '') : '';
    }
    return name;
  }

  String getIndustryName(int id) {
    var name = '';
    if (id != 0) {
      final item = listIndustry?.firstWhere((e) => e.id == id);
      name = item != null ? (item.industryName ?? '') : '';
    }
    return name;
  }

  String getPartnerFunctionName(int id) {
    var name = '';
    if (id != 0) {
      final item =
          listPartyInvolvedPartnerFunction?.firstWhere((e) => e.id == id);
      name = item != null ? (item.partyInvolvedPartnerFunctionName ?? '') : '';
    }
    return name;
  }
}
