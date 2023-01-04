import 'package:json_annotation/json_annotation.dart';
import 'package:sicix/shared/utils/date_util.dart';

import 'opportunity.dart';

part 'opportunity_info.g.dart';

@JsonSerializable()
class OpportunityInfo extends Opportunity {
  int? employeeId;
  String? employeeFirstName;
  String? employeeLastName;
  String? employeeMiddleName;
  int? accountId;
  String? accountName;
  DateTime? createDate;
  String? createBy;
  String? fullNameUserCreate;
  DateTime? modifiedDate;
  String? updateBy;
  String? fullNameUserUpdate;
  int? status;
  DateTime? startDate;
  String? description;
  int? opportunityTypeId;
  String? opportunityTypeName;
  int? leadSourceId;
  String? leadSourceName;
  int? opportunityStageReasonId;
  String? opportunityStageReasonName;
  double? probability;
  int? priceId;

  OpportunityInfo({
    this.employeeId,
    this.employeeFirstName,
    this.employeeLastName,
    this.employeeMiddleName,
    this.accountId,
    this.accountName,
    this.createDate,
    this.createBy,
    this.fullNameUserCreate,
    this.modifiedDate,
    this.updateBy,
    this.fullNameUserUpdate,
    this.status,
    this.startDate,
    this.description,
    this.opportunityTypeName,
    this.opportunityTypeId,
    this.leadSourceId,
    this.leadSourceName,
    this.opportunityStageReasonName,
    this.probability,
    this.priceId,
    this.opportunityStageReasonId,
  });

  factory OpportunityInfo.fromJson(Map<String, dynamic> json) =>
      _$OpportunityInfoFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$OpportunityInfoToJson(this);

  String getEmployeeFullName() {
    return '${employeeLastName ?? ''} ${employeeMiddleName ?? ''} ${employeeFirstName ?? ''}';
  }

  String getProbabilityString() {
    if (probability == null) {
      return '0%';
    }
    return '${(probability! * 100).toStringAsFixed(0)}%';
  }

  String getCreateAtContent() {
    return '${fullNameUserCreate ?? ''}, ${DateUtil.formatDatetimeToString(createDate, type: DateUtil.DATETIME_TYPE)} ';
  }

  String getUpdateAtContent() {
    return '${fullNameUserUpdate ?? ''}, ${DateUtil.formatDatetimeToString(modifiedDate, type: DateUtil.DATETIME_TYPE)} ';
  }

  bool isOpportunityHasPrice() {
    return priceId != null && priceId! > 0;
  }

  bool isOpportunityHasStageReason() {
    return opportunityStageReasonId != null && opportunityStageReasonId! > 0;
  }

  bool isOpportunityClosed() {
    if (opportunityStageId == 6 || opportunityStageId == 7) {
      return true;
    }
    return false;
  }
}
