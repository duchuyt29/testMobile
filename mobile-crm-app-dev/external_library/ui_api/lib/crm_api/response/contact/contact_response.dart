import 'package:json_annotation/json_annotation.dart';

import '../../models/account/account.dart';
import '../../models/contact/contact.dart';
import '../base_response.dart';

part 'contact_response.g.dart';

@JsonSerializable()
class ContactResponse extends BaseResponse {
  @JsonKey(name: 'data')
  Contact? data;
  ContactResponse({this.data}) : super(false);

  factory ContactResponse.fromJson(Map<String, dynamic> json) =>
      _$ContactResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ContactResponseToJson(this);
}
