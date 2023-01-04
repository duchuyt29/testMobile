import 'package:json_annotation/json_annotation.dart';
import 'package:sicix/shared/utils/date_util.dart';

import '../../models/common/crm_master_data/currency_exchange_rate.dart';
import '../../models/common/crm_master_data/lead_source.dart';
import '../../models/common/crm_master_data/opportunity_stage.dart';
import '../../models/employee/employee_model.dart';
import '../../models/opportunity/opp_account.dart';
import '../../models/product/product.dart';
// part 'opportunity_filter_request.g.dart';

@JsonSerializable()
class OpportunityFilterRequest {
  List<EmployeeModel>? ownerEmployees;
  List<OpportunityStage>? stageId;
  List<OppAccount>? accountId;
  List<Product>? productId;
  List<LeadSource>? leadSourceId;
  List<CurrencyExchangeRate>? currencyExchangeRateId;
  DateTime? fromDate;
  DateTime? toDate;
  DateTime? fromStartDate;
  DateTime? toStartDate;

  String? getAccountId() {
    if (accountId?.isEmpty ?? true) {
      return null;
    }
    return accountId
        ?.map((e) => e.id)
        .where((element) => element != null)
        .join(',');
  }

  String? getAccountName() {
    if (accountId?.isEmpty ?? true) {
      return null;
    }
    return accountId
        ?.map((e) => e.accountName)
        .where((element) => element != null)
        .join(',');
  }

  String? getLeadSource() {
    if (leadSourceId?.isEmpty ?? true) {
      return null;
    }
    return leadSourceId
        ?.map((e) => e.id)
        .where((element) => element != null)
        .join(',');
  }

  String? getLeadSourceName() {
    if (leadSourceId?.isEmpty ?? true) {
      return null;
    }
    return leadSourceId
        ?.map((e) => e.leadSourceName)
        .where((element) => element != null)
        .join(',');
  }

  String? getStageId() {
    if (stageId?.isEmpty ?? true) {
      return null;
    }
    return stageId
        ?.map((e) => e.id)
        .where((element) => element != null)
        .join(',');
  }

  String? getStageName() {
    if (stageId?.isEmpty ?? true) {
      return null;
    }
    return stageId
        ?.map((e) => e.opportunityStageName)
        .where((element) => element != null)
        .join(',');
  }

  String? getProductId() {
    if (productId?.isEmpty ?? true) {
      return null;
    }
    return productId
        ?.map((e) => e.id)
        .where((element) => element != null)
        .join(',');
  }

  String? getProductNames() {
    if (productId?.isEmpty ?? true) {
      return null;
    }
    return productId
        ?.map((e) => '${e.productCode}-${e.productName}')
        .where((element) => element != null)
        .join(',');
  }

  String? getEmployeeId() {
    if (ownerEmployees?.isEmpty ?? true) {
      return null;
    }
    return ownerEmployees
        ?.map((e) => e.id)
        .where((element) => element != null)
        .join(',');
  }

  String? getToDate() {
    return toDate == null
        ? null
        : DateUtil.formatDatetimeToString(toDate, type: DateUtil.DATE_API_TYPE);
  }

  String? getFromDate() {
    return fromDate == null
        ? null
        : DateUtil.formatDatetimeToString(fromDate,
            type: DateUtil.DATE_API_TYPE);
  }

  String? getToStartDate() {
    return toStartDate == null
        ? null
        : DateUtil.formatDatetimeToString(toStartDate,
            type: DateUtil.DATE_API_TYPE);
  }

  String? getFromStartDate() {
    return fromStartDate == null
        ? null
        : DateUtil.formatDatetimeToString(fromStartDate,
            type: DateUtil.DATE_API_TYPE);
  }

  String getFromDateText() {
    return DateUtil.formatDatetimeToString(fromDate);
  }

  String getToDateText() {
    return DateUtil.formatDatetimeToString(fromDate);
  }

  String getFromStartDateText() {
    return DateUtil.formatDatetimeToString(fromStartDate);
  }

  String getToStartDateText() {
    return DateUtil.formatDatetimeToString(toStartDate);
  }

  String getEmployeeInCharge() {
    if (ownerEmployees?.isEmpty ?? true) {
      return '';
    }
    return ownerEmployees!.map((e) => e.getFullname()).join(',');
  }

  String getCurrencies() {
    if (currencyExchangeRateId?.isEmpty ?? true) {
      return '';
    }
    return currencyExchangeRateId!.map((e) => e.id).join(',');
  }

  String getCurrenciesName() {
    if (currencyExchangeRateId?.isEmpty ?? true) {
      return '';
    }
    return currencyExchangeRateId!.map((e) => e.currencyName).join(',');
  }
}
