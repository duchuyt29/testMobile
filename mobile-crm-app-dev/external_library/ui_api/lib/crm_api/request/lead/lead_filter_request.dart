// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:sicix/shared/utils/date_util.dart';

import '../../models/common/crm_master_data/lead_potential_level.dart';
import '../../models/common/crm_master_data/lead_source.dart';
import '../../models/common/crm_master_data/lead_stage.dart';
import '../../models/employee/employee_model.dart';
import '../../models/product/product.dart';

class LeadFilterRequest {
  List<EmployeeModel>? ownerEmployees;
  List<LeadPotentialLevel>? leadPotentialLevels;
  List<LeadSource>? leadSources;
  List<LeadStage>? leadStages;
  List<Product>? leadProducts;
  DateTime? fromDate;
  DateTime? toDate;

  LeadFilterRequest({
    this.ownerEmployees,
    this.leadPotentialLevels,
    this.leadSources,
    this.leadStages,
    this.leadProducts,
    this.fromDate,
    this.toDate,
  });

  String? getLeadSourceId() {
    if (leadSources?.isEmpty ?? true) {
      return null;
    }
    return leadSources
        ?.map((e) => e.id)
        .where((element) => element != null)
        .join(',');
  }

  String? getStageId() {
    if (leadStages?.isEmpty ?? true) {
      return null;
    }
    return leadStages
        ?.map((e) => e.id)
        .where((element) => element != null)
        .join(',');
  }

  String? getProductId() {
    if (leadProducts?.isEmpty ?? true) {
      return null;
    }
    return leadProducts
        ?.map((e) => e.id)
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

  String? getLeadPotentialLevelId() {
    if (leadPotentialLevels?.isEmpty ?? true) {
      return null;
    }
    return leadPotentialLevels
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

  String getEmployeeInCharge() {
    if (ownerEmployees?.isEmpty ?? true) {
      return '';
    }
    return ownerEmployees!.map((e) => e.getFullname()).join(', ');
  }

  String getLeadPotentialLevel() {
    if (leadPotentialLevels?.isEmpty ?? true) {
      return '';
    }
    return leadPotentialLevels!.map((e) => e.leadPotentialLevelName).join(', ');
  }

  String getLeadSource() {
    if (leadSources?.isEmpty ?? true) {
      return '';
    }
    return leadSources!.map((e) => e.leadSourceName).join(', ');
  }

  String getLeadStage() {
    if (leadStages?.isEmpty ?? true) {
      return '';
    }
    return leadStages!.map((e) => e.leadStageName).join(', ');
  }

  String getLeadProduct() {
    if (leadProducts?.isEmpty ?? true) {
      return '';
    }
    return leadProducts!.map((e) => e.getTitle()).join(', ');
  }

  String getFromDateText() {
    return DateUtil.formatDatetimeToString(fromDate);
  }

  String getToDateText() {
    return DateUtil.formatDatetimeToString(fromDate);
  }
}
