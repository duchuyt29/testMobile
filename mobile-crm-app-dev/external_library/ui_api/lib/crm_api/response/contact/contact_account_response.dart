import 'package:json_annotation/json_annotation.dart';

import '../../models/contact/contact_account.dart';
import '../base_response.dart';

part 'contact_account_response.g.dart';

@JsonSerializable()
class ContactAccountResponse extends BaseResponse {
  @JsonKey(name: 'data')
  List<ContactAccount>? data;
  ContactAccountResponse({this.data}) : super(false);

  factory ContactAccountResponse.fromJson(Map<String, dynamic> json) =>
      _$ContactAccountResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ContactAccountResponseToJson(this);
}
