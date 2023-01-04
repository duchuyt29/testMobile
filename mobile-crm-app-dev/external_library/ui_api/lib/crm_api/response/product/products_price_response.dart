import 'package:json_annotation/json_annotation.dart';

import '../../models/product/product_price.dart';
import '../base_response.dart';

part 'products_price_response.g.dart';

@JsonSerializable()
class ProductsPriceResponse extends BaseResponse {
  final List<ProductPrice>? data;

  ProductsPriceResponse({this.data}) : super(false);

  factory ProductsPriceResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductsPriceResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ProductsPriceResponseToJson(this);
}
