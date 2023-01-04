import 'package:json_annotation/json_annotation.dart';

import '../../models/opportunity/opp_sale_party_involved.dart';
import '../base_response.dart';

part 'opp_sale_party_involved_response.g.dart';

@JsonSerializable()
class OppSalePartyInvolvedListResponse extends BaseResponse {
  @JsonKey(defaultValue: [])
  List<OppSalePartyInvolved>? data;
  OppSalePartyInvolvedListResponse({this.data}) : super(false);

  factory OppSalePartyInvolvedListResponse.fromJson(
          Map<String, dynamic> json) =>
      _$OppSalePartyInvolvedListResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() =>
      _$OppSalePartyInvolvedListResponseToJson(this);
}
