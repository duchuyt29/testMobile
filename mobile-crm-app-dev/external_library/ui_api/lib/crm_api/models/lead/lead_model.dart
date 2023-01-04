import 'package:json_annotation/json_annotation.dart';
import 'package:sicix/data/app_data_global.dart';
import 'package:sicix/shared/utils/app_util.dart';

import '../common/crm_master_data/lead_stage.dart';

part 'lead_model.g.dart';

@JsonSerializable()
class LeadModel {
  DateTime? createDate;
  DateTime? modifiedDate;
  int? status;
  String? createBy;
  String? updateBy;
  int? id;
  int? employeeId;
  String? leadCode;
  String? leadName;
  String? leadEmail;
  String? leadPhone;
  String? employeeFirstName;
  String? employeeLastName;
  String? employeeMiddleName;
  int? leadPotentialLevelId;
  String? leadPotentialLevelName;
  int? isConvert;
  int? leadStageId;

  LeadModel({
    this.createDate,
    this.modifiedDate,
    this.status,
    this.createBy,
    this.updateBy,
    this.id,
    this.employeeId,
    this.leadCode,
    this.leadName,
    this.leadEmail,
    this.leadPhone,
    this.employeeFirstName,
    this.employeeLastName,
    this.employeeMiddleName,
    this.leadPotentialLevelId,
    this.leadPotentialLevelName,
    this.isConvert,
    this.leadStageId,
  });

  factory LeadModel.fromJson(Map<String, dynamic> json) {
    return _$LeadModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LeadModelToJson(this);

  String getLeadTitle() {
    return '$leadName - $leadCode';
  }

  String getEmplpoyeeFullname() {
    return AppUtil.cleanDuplicateWhitespace(
        '${employeeLastName ?? ''} ${employeeMiddleName ?? ''} ${employeeFirstName ?? ''}');
  }
}
