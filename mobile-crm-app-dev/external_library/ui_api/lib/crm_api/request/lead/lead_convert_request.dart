import 'package:json_annotation/json_annotation.dart';
import 'package:sicix/shared/utils/date_util.dart';

part 'lead_convert_request.g.dart';

@JsonSerializable()
class LeadConvertRequest {
  int? accountId;
  String? accountName;
  int? accountTypeId;
  String? accountPhone;
  int? documentTypeId;
  String? documentNumber;
  int? contactId;
  String? contactName;
  String? contactPhone;
  String? contactTitle;
  int? accountRelationTypeId;
  int? leadId;
  String? opportunityName;
  int? stageId;
  int? currencyExchangeRateId;
  @JsonKey(toJson: _dateToString)
  DateTime? closeDate;
  int? leadStageId;
  int? employeeId;
  @JsonKey(toJson: _dateToString)
  DateTime? startDate;

  @JsonKey(ignore: true)
  int? indexAccountType;
  @JsonKey(ignore: true)
  int? indexDocumentType;

  LeadConvertRequest({
    this.accountId,
    this.accountName,
    this.accountTypeId,
    this.accountPhone,
    this.documentTypeId,
    this.documentNumber,
    this.contactId,
    this.contactName,
    this.contactPhone,
    this.contactTitle,
    this.accountRelationTypeId,
    this.leadId,
    this.opportunityName,
    this.stageId,
    this.currencyExchangeRateId,
    this.closeDate,
    this.leadStageId,
    this.employeeId,
    this.startDate,
  });

  factory LeadConvertRequest.fromJson(Map<String, dynamic> json) {
    return _$LeadConvertRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LeadConvertRequestToJson(this);
}

String? _dateToString(DateTime? date) {
  if (date == null) {
    return null;
  }
  return DateUtil.formatDatetimeToString(date.toUtc(), type: DateUtil.API_TYPE);
}
