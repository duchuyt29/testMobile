import 'package:json_annotation/json_annotation.dart';

part 'product_price_request.g.dart';

@JsonSerializable()
class ProductPriceRequest {
  final int? id;
  final String? currencyCode;
  final String? currencyName;

  final double? listPrice;
  final String? priceCode;

  final String? priceName;

  ProductPriceRequest(
      {this.id,
      this.currencyCode,
      this.currencyName,
      this.listPrice,
      this.priceCode,
      this.priceName});

  factory ProductPriceRequest.fromJson(Map<String, dynamic> json) =>
      _$ProductPriceRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ProductPriceRequestToJson(this);
}
