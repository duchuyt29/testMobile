import 'package:json_annotation/json_annotation.dart';

import '../../models/lead/lead_format_address.dart';
import '../base_response.dart';

part 'lead_format_address_response.g.dart';

@JsonSerializable()
class LeadFormatAddressResponse extends BaseResponse {
  @JsonKey(name: 'data')
  LeadFormatAddress? data;

  LeadFormatAddressResponse({this.data}) : super(false);

  factory LeadFormatAddressResponse.fromJson(Map<String, dynamic> json) =>
      _$LeadFormatAddressResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$LeadFormatAddressResponseToJson(this);
}
