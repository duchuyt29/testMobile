import 'package:json_annotation/json_annotation.dart';

import '../../models/contact/contact.dart';
import '../base_response.dart';

part 'contact_all_response.g.dart';

@JsonSerializable()
class ContactAllResponse extends BaseResponse {
  @JsonKey(name: 'data')
  List<Contact>? data;
  ContactAllResponse({this.data}) : super(false);

  factory ContactAllResponse.fromJson(Map<String, dynamic> json) =>
      _$ContactAllResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ContactAllResponseToJson(this);
}
