// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_document_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountDocumentRequest _$AccountDocumentRequestFromJson(
    Map<String, dynamic> json) {
  $checkKeys(
    json,
    disallowNullValues: const ['id'],
  );
  return AccountDocumentRequest(
    accountId: json['accountId'] as int?,
    id: json['id'] as int?,
    documentTypeId: json['documentTypeId'] as int?,
    documentNumber: json['documentNumber'] as String?,
    issueDate: json['issueDate'] == null
        ? null
        : DateTime.parse(json['issueDate'] as String),
    issuePlace: json['issuePlace'] as String?,
    note: json['note'] as String?,
  );
}

Map<String, dynamic> _$AccountDocumentRequestToJson(
    AccountDocumentRequest instance) {
  final val = <String, dynamic>{
    'accountId': instance.accountId,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  val['documentTypeId'] = instance.documentTypeId;
  val['documentNumber'] = instance.documentNumber;
  val['issueDate'] = _dateToString(instance.issueDate);
  val['issuePlace'] = instance.issuePlace;
  val['note'] = instance.note;
  return val;
}
