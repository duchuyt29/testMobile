import 'package:json_annotation/json_annotation.dart';

part 'account_type.g.dart';

@JsonSerializable()
class AccountType {
  String? accountTypeName;
  int? id;

  AccountType({this.accountTypeName, this.id});

  factory AccountType.fromJson(Map<String, dynamic> json) {
    return _$AccountTypeFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AccountTypeToJson(this);
}
