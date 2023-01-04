// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContactAccount _$ContactAccountFromJson(Map<String, dynamic> json) =>
    ContactAccount(
      accountActive: json['accountActive'] as int?,
      objectTypeId: json['objectTypeId'] as int?,
      accountRelationTypeName: json['accountRelationTypeName'] as String?,
      accountId: json['accountId'] as int?,
      accountRelationTypeId: json['accountRelationTypeId'] as int?,
      id: json['id'] as int?,
      accountName: json['accountName'] as String?,
    );

Map<String, dynamic> _$ContactAccountToJson(ContactAccount instance) =>
    <String, dynamic>{
      'accountActive': instance.accountActive,
      'objectTypeId': instance.objectTypeId,
      'accountRelationTypeName': instance.accountRelationTypeName,
      'accountId': instance.accountId,
      'accountRelationTypeId': instance.accountRelationTypeId,
      'id': instance.id,
      'accountName': instance.accountName,
    };
