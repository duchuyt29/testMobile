import 'package:json_annotation/json_annotation.dart';

import '../../models/account/account_contact.dart';
import '../base_response.dart';

part 'account_contact_response.g.dart';

@JsonSerializable()
class AccountContactResponse extends BaseResponse {
  @JsonKey(name: 'data')
  List<AccountContact>? data;
  AccountContactResponse({this.data}) : super(false);

  factory AccountContactResponse.fromJson(Map<String, dynamic> json) =>
      _$AccountContactResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$AccountContactResponseToJson(this);
}
