import 'package:json_annotation/json_annotation.dart';

import '../../models/contact/contact_party_involved.dart';
import '../base_response.dart';

part 'contact_party_involved_response.g.dart';

@JsonSerializable()
class ContactPartyInvolvedResponse extends BaseResponse {
  @JsonKey(name: 'data')
  List<ContactPartyInvolved>? data;
  ContactPartyInvolvedResponse({this.data}) : super(false);

  factory ContactPartyInvolvedResponse.fromJson(Map<String, dynamic> json) =>
      _$ContactPartyInvolvedResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ContactPartyInvolvedResponseToJson(this);
}
