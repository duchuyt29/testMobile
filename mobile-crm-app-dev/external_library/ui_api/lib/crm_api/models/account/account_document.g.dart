// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_document.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountDocument _$AccountDocumentFromJson(Map<String, dynamic> json) =>
    AccountDocument(
      createDate: json['createDate'] as String?,
      modifiedDate: json['modifiedDate'] as String?,
      status: json['status'] as int?,
      createBy: json['createBy'] as String?,
      updateBy: json['updateBy'] as String?,
      id: json['id'] as int?,
      documentTypeId: json['documentTypeId'] as int?,
      documentTypeName: json['documentTypeName'] as String?,
      documentNumber: json['documentNumber'] as String?,
      accountDocumentUUID: json['accountDocumentUUID'] as String?,
      issueDate: json['issueDate'] == null
          ? null
          : DateTime.parse(json['issueDate'] as String),
      issuePlace: json['issuePlace'] as String?,
      note: json['note'] as String?,
      accountId: json['accountId'] as int?,
    );

Map<String, dynamic> _$AccountDocumentToJson(AccountDocument instance) =>
    <String, dynamic>{
      'createDate': instance.createDate,
      'modifiedDate': instance.modifiedDate,
      'status': instance.status,
      'createBy': instance.createBy,
      'updateBy': instance.updateBy,
      'id': instance.id,
      'documentTypeId': instance.documentTypeId,
      'documentTypeName': instance.documentTypeName,
      'documentNumber': instance.documentNumber,
      'accountDocumentUUID': instance.accountDocumentUUID,
      'issueDate': _dateToString(instance.issueDate),
      'issuePlace': instance.issuePlace,
      'note': instance.note,
      'accountId': instance.accountId,
    };
