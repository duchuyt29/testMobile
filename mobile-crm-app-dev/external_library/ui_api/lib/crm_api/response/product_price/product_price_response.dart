import 'package:json_annotation/json_annotation.dart';

import '../../models/product_price/product_price.dart';
import '../base_response.dart';

part 'product_price_response.g.dart';

@JsonSerializable()
class ProductPriceResponse extends BaseResponse {
  @JsonKey(name: 'data')
  ProductPrice? data;

  ProductPriceResponse(this.data) : super(false);

  factory ProductPriceResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductPriceResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ProductPriceResponseToJson(this);
}
