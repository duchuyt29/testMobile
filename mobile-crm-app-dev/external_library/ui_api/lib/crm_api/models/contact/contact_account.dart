import 'package:json_annotation/json_annotation.dart';

part 'contact_account.g.dart';

@JsonSerializable()
class ContactAccount {
  int? accountActive;
  int? objectTypeId;
  String? accountRelationTypeName;
  int? accountId;
  int? accountRelationTypeId;
  int? id;
  String? accountName;

  ContactAccount({
    this.accountActive,
    this.objectTypeId,
    this.accountRelationTypeName,
    this.accountId,
    this.accountRelationTypeId,
    this.id,
    this.accountName,
  });

  factory ContactAccount.fromJson(Map<String, dynamic> json) => _$ContactAccountFromJson(json);

  Map<String, dynamic> toJson() => _$ContactAccountToJson(this);
}
