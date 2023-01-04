import 'package:json_annotation/json_annotation.dart';

part 'activity_contact.g.dart';

@JsonSerializable(includeIfNull: false)
class ActivityContact {
  int? id;
  String? contactName;
  String? contactPhone;
  String? contactTitle;
  int? contactId;
  int? accountRelationTypeId;
  String? accountRelationTypeName;
  int? contactActive;
  String? contactEmail;
  int? objectTypeId;

  ActivityContact({
    this.id,
    this.contactName,
    this.contactPhone,
    this.contactTitle,
    this.contactId,
    this.accountRelationTypeId,
    this.accountRelationTypeName,
    this.contactActive,
    this.contactEmail,
    this.objectTypeId,
  });

  factory ActivityContact.fromJson(Map<String, dynamic> json) =>
      _$ActivityContactFromJson(json);

  Map<String, dynamic> toJson() => _$ActivityContactToJson(this);
}
