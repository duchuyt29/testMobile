import 'package:get/get.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:sicix/data/app_data_global.dart';
import 'package:sicix/shared/utils/date_util.dart';

import '../common/crm_master_data/gender.dart';
import '../common/crm_master_data/industry.dart';
import '../common/crm_master_data/lead_potential_level.dart';
import '../common/crm_master_data/lead_source.dart';
import '../common/crm_master_data/lead_stage.dart';
import '../common/crm_master_data/salutation.dart';
import '../common/district.dart';
import '../common/province.dart';
import '../common/ward.dart';
import '../employee/employee_model.dart';
import '../product/product.dart';
import 'lead_model.dart';
import 'lead_stage_reason.dart';

part 'lead_detail.g.dart';

@JsonSerializable(includeIfNull: false)
class LeadDetail {
  @JsonKey(toJson: _dateToString)
  DateTime? createDate;
  @JsonKey(toJson: _dateToString)
  DateTime? modifiedDate;
  int? status;
  String? createBy;
  String? updateBy;
  int? id;
  int? employeeId;
  int? genderId;
  int? salutationId;
  String? leadCode;
  String? leadName;
  String? leadEmail;
  String? leadPhone;
  int? leadStageId;
  int? leadStageReasonId;
  String? company;
  int? leadIndustryId;
  String? leadTitle;
  int? leadAddressTypeId;
  int? leadSourceId;
  String? sourceDescription;
  String? leadStreet;
  int? leadWardId;
  String? leadWardName;
  int? leadDistrictId;
  String? leadDistrictName;
  int? leadProvinceId;
  String? leadProvinceName;
  String? leadCountryId;
  String? leadCountryName;
  String? leadPostalCode;
  String? description;
  String? fullAddress;
  int? leadPotentialLevelId;
  @JsonKey(name: 'leadUUID')
  String? leadUuid;
  int? isConvert;
  @JsonKey(toJson: _dateToString)
  DateTime? startDate;
  List<Product>? leadProducts;

  String? employeeFirstName;
  String? employeeLastName;
  String? employeeMiddleName;
  String? fullNameUserCreate;
  String? fullNameUserUpdate;

  // @JsonKey(ignore: true)
  // UserInfo? createUserInfo;
  // @JsonKey(ignore: true)
  // UserInfo? updateUserInfo;

  LeadDetail({
    this.createDate,
    this.modifiedDate,
    this.status,
    this.createBy,
    this.updateBy,
    this.id,
    this.employeeId,
    this.genderId,
    this.salutationId,
    this.leadCode,
    this.leadName,
    this.leadEmail,
    this.leadPhone,
    this.leadStageId,
    this.leadStageReasonId,
    this.company,
    this.leadIndustryId,
    this.leadTitle,
    this.leadAddressTypeId,
    this.leadSourceId,
    this.sourceDescription,
    this.leadStreet,
    this.leadWardId,
    this.leadWardName,
    this.leadDistrictId,
    this.leadDistrictName,
    this.leadProvinceId,
    this.leadProvinceName,
    this.leadCountryId,
    this.leadCountryName,
    this.leadPostalCode,
    this.description,
    this.fullAddress,
    this.leadPotentialLevelId,
    this.leadUuid,
    this.isConvert,
    this.startDate,
    this.leadProducts,
    this.employeeFirstName,
    this.employeeLastName,
    this.employeeMiddleName,
    this.fullNameUserCreate,
    this.fullNameUserUpdate,
  });

  factory LeadDetail.fromJson(Map<String, dynamic> json) {
    return _$LeadDetailFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LeadDetailToJson(this);

  bool isDone() {
    return isConvert == 1 || (leadStageId ?? 0) >= 3;
  }

  String getLeadTitle() {
    return '$leadName - $leadCode';
  }

  EmployeeModel? getEmplpoyee() {
    return AppDataGlobal.employees
        .firstWhereOrNull((element) => element.id == employeeId);
  }

  Gender? getGender() {
    return AppDataGlobal.crmMasterData?.listGender
        ?.firstWhereOrNull((element) => element.id == genderId);
  }

  Salutation? getSalutation() {
    return AppDataGlobal.crmMasterData?.listSalutation
        ?.firstWhereOrNull((element) => element.id == salutationId);
  }

  Industry? getIndustry() {
    return AppDataGlobal.crmMasterData?.listIndustry
        ?.firstWhereOrNull((element) => element.id == leadIndustryId);
  }

  LeadSource? getLeadSource() {
    return AppDataGlobal.crmMasterData?.leadSources
        ?.firstWhereOrNull((element) => element.id == leadSourceId);
  }

  LeadStage? getLeadStage() {
    return AppDataGlobal.crmMasterData?.listLeadStage
        ?.firstWhereOrNull((element) => element.id == leadStageId);
  }

  LeadPotentialLevel? getLeadPotentialLevel() {
    return AppDataGlobal.crmMasterData?.listLeadPotentialLevel
        ?.firstWhereOrNull((element) => element.id == leadPotentialLevelId);
  }

  String getProductsInterest() {
    return leadProducts
            ?.map((e) => (e.productName ?? '').trim())
            .where((element) => element.isNotEmpty)
            .join(', ') ??
        '';
  }

  String getCreateLog() {
    final logs = <String>[];
    logs.add(fullNameUserCreate ?? '');
    logs.add(DateUtil.formatDatetimeToString(createDate,
        type: DateUtil.DATETIME_TYPE));
    return logs.where((element) => element.isNotEmpty).join(', ');
  }

  String getUpdateLog() {
    final logs = <String>[];
    logs.add(fullNameUserUpdate ?? '');
    logs.add(DateUtil.formatDatetimeToString(modifiedDate,
        type: DateUtil.DATETIME_TYPE));
    return logs.where((element) => element.isNotEmpty).join(', ');
  }

  String getFullAddress() {
    if (fullAddress?.isNotEmpty ?? false) {
      return fullAddress!;
    }
    final address = <String>[];
    if (leadStreet?.isNotEmpty ?? false) {
      address.add(leadStreet!);
    }
    if (leadWardName?.isNotEmpty ?? false) {
      address.add(leadWardName!);
    }
    if (leadDistrictName?.isNotEmpty ?? false) {
      address.add(leadDistrictName!);
    }
    if (leadProvinceName?.isNotEmpty ?? false) {
      address.add(leadProvinceName!);
    }
    if (leadCountryName?.isNotEmpty ?? false) {
      address.add(leadCountryName!);
    }
    return address.join(', ');
  }

  LeadModel getLead() {
    return LeadModel(
      createDate: createDate,
      modifiedDate: modifiedDate,
      status: status,
      createBy: createBy,
      updateBy: updateBy,
      id: id,
      employeeId: employeeId,
      leadCode: leadCode,
      leadName: leadName,
      leadEmail: leadEmail,
      leadPhone: leadPhone,
      employeeFirstName: employeeFirstName,
      employeeLastName: employeeLastName,
      employeeMiddleName: employeeMiddleName,
      leadPotentialLevelId: leadPotentialLevelId,
      leadPotentialLevelName:
          getLeadPotentialLevel()?.leadPotentialLevelName ?? '',
      isConvert: isConvert,
      leadStageId: leadStageId,
    );
  }

  Province? getProvince() {
    if (leadProvinceId != null) {
      return Province(id: leadProvinceId, provinceName: leadProvinceName);
    }
    return null;
  }

  District? getDistrict() {
    if (leadDistrictId != null) {
      return District(id: leadDistrictId, districtName: leadDistrictName);
    }
    return null;
  }

  Ward? getWard() {
    if (leadWardId != null) {
      return Ward(id: leadWardId, wardName: leadWardName);
    }
    return null;
  }

  LeadStageReason? getLeadStageReason() {
    return AppDataGlobal.leadStageReasons[leadStageId]
        ?.firstWhereOrNull((element) => element.id == leadStageReasonId);
  }
}

String? _dateToString(DateTime? date) {
  if (date == null) {
    return null;
  }
  return DateUtil.formatDatetimeToString(date.toUtc(), type: DateUtil.API_TYPE);
}
