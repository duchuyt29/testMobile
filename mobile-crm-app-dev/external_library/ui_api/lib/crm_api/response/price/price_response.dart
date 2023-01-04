import 'package:json_annotation/json_annotation.dart';

import '../../models/price/price.dart';
import '../base_response.dart';

part 'price_response.g.dart';

@JsonSerializable()
class PriceResponse extends BaseResponse {
  @JsonKey(name: 'data')
  Price? data;
  PriceResponse({this.data}) : super(false);

  factory PriceResponse.fromJson(Map<String, dynamic> json) =>
      _$PriceResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PriceResponseToJson(this);
}
