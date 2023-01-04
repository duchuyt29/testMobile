import 'package:json_annotation/json_annotation.dart';
import 'package:sicix/data/app_data_global.dart';

import '../base_models.dart';

part 'opportunity.g.dart';

@JsonSerializable()
class Opportunity {
  double? amount;
  int? id;
  int? currencyExchangeRateId;
  DateTime? closeDate;
  String? opportunityName;
  String? opportunityCode;
  int? opportunityStageId;

  Opportunity(
      {this.amount,
      this.id,
      this.currencyExchangeRateId,
      this.closeDate,
      this.opportunityName,
      this.opportunityCode,
      this.opportunityStageId});

  factory Opportunity.fromJson(Map<String, dynamic> json) {
    return _$OpportunityFromJson(json);
  }

  Map<String, dynamic> toJson() => _$OpportunityToJson(this);

  String getAmount() {
    if (amount != null) {
      if (AppDataGlobal.crmMasterData!.listCurrencyExchangeRate != null) {
        return '${amount?.toStringAsFixed(0)} ${AppDataGlobal.crmMasterData!.listCurrencyExchangeRate!.firstWhere((element) => element.id == currencyExchangeRateId).currencyCode!} ';
      } else {
        return amount.toString();
      }
    }
    return '${0} ${AppDataGlobal.crmMasterData!.listCurrencyExchangeRate!.firstWhere((element) => element.id == currencyExchangeRateId).currencyCode!} ';
  }

  String getAmountByCurrencyId(int id) {
    if (amount != null) {
      if (AppDataGlobal.crmMasterData!.listCurrencyExchangeRate != null) {
        return '${amount?.toStringAsFixed(0)} ${AppDataGlobal.crmMasterData!.listCurrencyExchangeRate!.firstWhere((element) => element.id == id).currencyCode!} ';
      } else {
        return amount.toString();
      }
    }
    return '0 ${AppDataGlobal.crmMasterData!.listCurrencyExchangeRate!.firstWhere((element) => element.id == id).currencyCode!}';
  }

  String getCurrencyName() {
    if (AppDataGlobal.crmMasterData!.listCurrencyExchangeRate != null) {
      return AppDataGlobal.crmMasterData!.listCurrencyExchangeRate!
          .firstWhere((element) => element.id == currencyExchangeRateId)
          .currencyName!;
    }
    return '0';
  }

  String getStageName() {
    if (opportunityStageId != null) {
      if (AppDataGlobal.crmMasterData!.listOpportunityStage != null) {
        return AppDataGlobal.crmMasterData!.listOpportunityStage!
            .firstWhere((element) => element.id == opportunityStageId)
            .opportunityStageName!;
      } else {
        return '';
      }
    }
    return '';
  }

  bool isOpportunityClose() {
    if (opportunityStageId == 7 || opportunityStageId == 6) {
      return true;
    }
    return false;
  }
}

@JsonSerializable()
class Opportunities extends BaseModels {
  @JsonKey(defaultValue: [])
  List<Opportunity> content;

  Opportunities(this.content);

  factory Opportunities.fromJson(Map<String, dynamic> json) {
    return _$OpportunitiesFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() => _$OpportunitiesToJson(this);
}
