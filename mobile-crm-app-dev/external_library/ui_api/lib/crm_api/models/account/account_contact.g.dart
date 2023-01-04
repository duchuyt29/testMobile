// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_contact.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountContact _$AccountContactFromJson(Map<String, dynamic> json) =>
    AccountContact(
      contactActive: json['contactActive'] as int?,
      objectTypeId: json['objectTypeId'] as int?,
      id: json['id'] as int?,
      contactName: json['contactName'] as String?,
      accountRelationTypeName: json['accountRelationTypeName'] as String?,
      contactPhone: json['contactPhone'] as String?,
      contactEmail: json['contactEmail'] as String?,
      contactId: json['contactId'] as int?,
      accountRelationTypeId: json['accountRelationTypeId'] as int?,
      contactTitle: json['contactTitle'] as String?,
    );

Map<String, dynamic> _$AccountContactToJson(AccountContact instance) =>
    <String, dynamic>{
      'contactActive': instance.contactActive,
      'objectTypeId': instance.objectTypeId,
      'id': instance.id,
      'contactName': instance.contactName,
      'accountRelationTypeName': instance.accountRelationTypeName,
      'contactPhone': instance.contactPhone,
      'contactEmail': instance.contactEmail,
      'contactId': instance.contactId,
      'accountRelationTypeId': instance.accountRelationTypeId,
      'contactTitle': instance.contactTitle,
    };
