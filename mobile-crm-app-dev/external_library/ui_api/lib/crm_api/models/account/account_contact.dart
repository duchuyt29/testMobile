import 'package:json_annotation/json_annotation.dart';

part 'account_contact.g.dart';

@JsonSerializable()
class AccountContact {
  int? contactActive;
  int? objectTypeId;
  int? id;
  String? contactName;
  String? accountRelationTypeName;
  String? contactPhone;
  String? contactEmail;
  int? contactId;
  int? accountRelationTypeId;
  String? contactTitle;

  AccountContact({
    this.contactActive,
    this.objectTypeId,
    this.id,
    this.contactName,
    this.accountRelationTypeName,
    this.contactPhone,
    this.contactEmail,
    this.contactId,
    this.accountRelationTypeId,
    this.contactTitle,
  });

  factory AccountContact.fromJson(Map<String, dynamic> json) =>
      _$AccountContactFromJson(json);

  Map<String, dynamic> toJson() => _$AccountContactToJson(this);
}
