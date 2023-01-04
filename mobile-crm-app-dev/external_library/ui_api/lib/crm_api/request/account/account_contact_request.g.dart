// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_contact_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountContactRequest _$AccountContactRequestFromJson(
    Map<String, dynamic> json) {
  $checkKeys(
    json,
    disallowNullValues: const [
      'accountId',
      'accountRelationTypeId',
      'contactIds'
    ],
  );
  return AccountContactRequest(
    accountRelationTypeId: json['accountRelationTypeId'] as int?,
    accountId: json['accountId'] as String?,
    contactIds:
        (json['contactIds'] as List<dynamic>?)?.map((e) => e as int).toList(),
  );
}

Map<String, dynamic> _$AccountContactRequestToJson(
    AccountContactRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('accountId', instance.accountId);
  writeNotNull('accountRelationTypeId', instance.accountRelationTypeId);
  writeNotNull('contactIds', instance.contactIds);
  return val;
}

AccountContactAccountRequest _$AccountContactAccountRequestFromJson(
    Map<String, dynamic> json) {
  $checkKeys(
    json,
    disallowNullValues: const [
      'currentAccountId',
      'accountRelationTypeId',
      'accountId'
    ],
  );
  return AccountContactAccountRequest(
    currentAccountId: json['currentAccountId'] as String?,
    accountRelationTypeId: json['accountRelationTypeId'] as int?,
    accountId: json['accountId'] as int?,
  );
}

Map<String, dynamic> _$AccountContactAccountRequestToJson(
    AccountContactAccountRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('currentAccountId', instance.currentAccountId);
  writeNotNull('accountRelationTypeId', instance.accountRelationTypeId);
  writeNotNull('accountId', instance.accountId);
  return val;
}
