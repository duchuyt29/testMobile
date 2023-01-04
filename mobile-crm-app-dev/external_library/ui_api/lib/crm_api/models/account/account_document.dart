import 'package:json_annotation/json_annotation.dart';
import 'package:sicix/shared/utils/date_util.dart';

import '../../../sicix_api/models/base_models.dart';

part 'account_document.g.dart';

@JsonSerializable()
class AccountDocument {
  String? createDate;
  String? modifiedDate;
  int? status;
  String? createBy;
  String? updateBy;
  int? id;
  int? documentTypeId;
  String? documentTypeName;
  String? documentNumber;
  String? accountDocumentUUID;
  @JsonKey(toJson: _dateToString)
  DateTime? issueDate;
  String? issuePlace;
  String? note;
  int? accountId;

  AccountDocument(
      {this.createDate,
      this.modifiedDate,
      this.status,
      this.createBy,
      this.updateBy,
      this.id,
      this.documentTypeId,
      this.documentTypeName,
      this.documentNumber,
      this.accountDocumentUUID,
      this.issueDate,
      this.issuePlace,
      this.note,
      this.accountId});

  factory AccountDocument.fromJson(Map<String, dynamic> json) {
    return _$AccountDocumentFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AccountDocumentToJson(this);

  String getIssueDate() {
    return '${DateUtil.formatDatetimeToString(issueDate, type: DateUtil.DATE_TYPE)} ';
  }

  String getFullDocument() {
    final nameOption = <String>[];
    if (issueDate != null) {
      nameOption.add(
          'Ngày cấp: ${DateUtil.formatDatetimeToString(issueDate, type: DateUtil.DATE_TYPE)}');
    }
    if (issuePlace != null) {
      nameOption.add('nơi cấp $issuePlace');
    }
    return nameOption.join(', ');
  }
}

String? _dateToString(DateTime? date) {
  // return date?.toUtc().toString() ?? '';
  if (date == null) {
    return null;
  }
  return DateUtil.formatDatetimeToString(date.toUtc(), type: DateUtil.API_TYPE);
}
