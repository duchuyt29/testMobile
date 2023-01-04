import 'package:json_annotation/json_annotation.dart';
part 'account_contact_request.g.dart';

@JsonSerializable()
class AccountContactRequest {
  @JsonKey(disallowNullValue: true)
  final String? accountId;
  @JsonKey(disallowNullValue: true)
  final int? accountRelationTypeId;
  @JsonKey(disallowNullValue: true)
  final List<int>? contactIds;

  AccountContactRequest({
    this.accountRelationTypeId,
    this.accountId,
    this.contactIds,
  });

  factory AccountContactRequest.fromJson(Map<String, dynamic> json) =>
      _$AccountContactRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AccountContactRequestToJson(this);
}

@JsonSerializable()
class AccountContactAccountRequest {
  @JsonKey(disallowNullValue: true)
  final String? currentAccountId;
  @JsonKey(disallowNullValue: true)
  final int? accountRelationTypeId;
  @JsonKey(disallowNullValue: true)
  final int? accountId;

  AccountContactAccountRequest({
    this.currentAccountId,
    this.accountRelationTypeId,
    this.accountId,
  });

  factory AccountContactAccountRequest.fromJson(Map<String, dynamic> json) =>
      _$AccountContactAccountRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AccountContactAccountRequestToJson(this);
}
