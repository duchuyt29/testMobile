import 'package:get/get.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:sicix/data/app_data_global.dart';
import 'package:sicix/shared/utils/date_util.dart';

import '../../models/common/crm_master_data/lead_stage.dart';

part 'lead_status_request.g.dart';

@JsonSerializable(includeIfNull: false)
class LeadStatusRequest {
  int? id;
  int? leadStageId;
  int? leadPotentialLevelId;
  int? leadStageReasonId;
  @JsonKey(toJson: _dateToString)
  DateTime? startDate;

  LeadStatusRequest({
    this.id,
    this.leadStageId,
    this.leadPotentialLevelId,
    this.leadStageReasonId,
    this.startDate,
  });

  factory LeadStatusRequest.fromJson(Map<String, dynamic> json) {
    return _$LeadStatusRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LeadStatusRequestToJson(this);

  LeadStage? getLeadStage() {
    return AppDataGlobal.crmMasterData?.listLeadStage
        ?.firstWhereOrNull((element) => element.id == leadStageId);
  }
}

String? _dateToString(DateTime? date) {
  if (date == null) {
    return null;
  }
  return DateUtil.formatDatetimeToString(date.toUtc(), type: DateUtil.API_TYPE);
}
