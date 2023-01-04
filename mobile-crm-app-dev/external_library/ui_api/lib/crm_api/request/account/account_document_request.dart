import 'package:json_annotation/json_annotation.dart';
import 'package:sicix/shared/utils/date_util.dart';
part 'account_document_request.g.dart';

@JsonSerializable()
class AccountDocumentRequest {
  final int? accountId;
  @JsonKey(disallowNullValue: true)
  final int? id;
  final int? documentTypeId;
  final String? documentNumber;
  @JsonKey(toJson: _dateToString)
  final DateTime? issueDate;
  final String? issuePlace;
  final String? note;

  AccountDocumentRequest({
    this.accountId,
    this.id,
    this.documentTypeId,
    this.documentNumber,
    this.issueDate,
    this.issuePlace,
    this.note,
  });

  factory AccountDocumentRequest.fromJson(Map<String, dynamic> json) =>
      _$AccountDocumentRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AccountDocumentRequestToJson(this);
}

String? _dateToString(DateTime? date) {
  // return date?.toUtc().toString() ?? '';
  if (date == null) {
    return null;
  }
  return DateUtil.formatDatetimeToString(date.toUtc(), type: DateUtil.API_TYPE);
}
