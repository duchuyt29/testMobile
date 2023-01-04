import 'package:json_annotation/json_annotation.dart';

part 'account_relation_type.g.dart';

@JsonSerializable()
class AccountRelationType {
  int? accountaccountRelationRelatedId;
  String? accountRelationTypeName;
  int? id;

  AccountRelationType({
    this.accountaccountRelationRelatedId,
    this.accountRelationTypeName,
    this.id,
  });

  factory AccountRelationType.fromJson(Map<String, dynamic> json) {
    return _$AccountRelationTypeFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AccountRelationTypeToJson(this);
}
