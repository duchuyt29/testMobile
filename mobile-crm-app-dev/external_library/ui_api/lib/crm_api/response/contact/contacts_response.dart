import 'package:json_annotation/json_annotation.dart';

import '../../models/account/account.dart';
import '../../models/contact/contact.dart';
import '../base_response.dart';

part 'contacts_response.g.dart';

@JsonSerializable()
class ContactsResponse extends BaseResponse {
  @JsonKey(name: 'data')
  Contacts? data;
  ContactsResponse({this.data}) : super(false);

  factory ContactsResponse.fromJson(Map<String, dynamic> json) =>
      _$ContactsResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ContactsResponseToJson(this);
}
