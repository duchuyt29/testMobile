// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_contact.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActivityContact _$ActivityContactFromJson(Map<String, dynamic> json) =>
    ActivityContact(
      id: json['id'] as int?,
      contactName: json['contactName'] as String?,
      contactPhone: json['contactPhone'] as String?,
      contactTitle: json['contactTitle'] as String?,
      contactId: json['contactId'] as int?,
      accountRelationTypeId: json['accountRelationTypeId'] as int?,
      accountRelationTypeName: json['accountRelationTypeName'] as String?,
      contactActive: json['contactActive'] as int?,
      contactEmail: json['contactEmail'] as String?,
      objectTypeId: json['objectTypeId'] as int?,
    );

Map<String, dynamic> _$ActivityContactToJson(ActivityContact instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('contactName', instance.contactName);
  writeNotNull('contactPhone', instance.contactPhone);
  writeNotNull('contactTitle', instance.contactTitle);
  writeNotNull('contactId', instance.contactId);
  writeNotNull('accountRelationTypeId', instance.accountRelationTypeId);
  writeNotNull('accountRelationTypeName', instance.accountRelationTypeName);
  writeNotNull('contactActive', instance.contactActive);
  writeNotNull('contactEmail', instance.contactEmail);
  writeNotNull('objectTypeId', instance.objectTypeId);
  return val;
}
