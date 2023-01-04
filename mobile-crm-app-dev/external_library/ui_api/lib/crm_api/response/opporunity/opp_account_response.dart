import 'package:json_annotation/json_annotation.dart';

import '../../models/opportunity/opp_account.dart';
import '../base_response.dart';

part 'opp_account_response.g.dart';

@JsonSerializable()
class OppAccountResponse extends BaseResponse {
  @JsonKey(defaultValue: [])
  List<OppAccount>? data;
  OppAccountResponse({this.data}) : super(false);

  factory OppAccountResponse.fromJson(Map<String, dynamic> json) =>
      _$OppAccountResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$OppAccountResponseToJson(this);
}
