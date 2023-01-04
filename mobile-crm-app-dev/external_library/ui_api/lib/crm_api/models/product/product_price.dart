import 'package:json_annotation/json_annotation.dart';

part 'product_price.g.dart';

@JsonSerializable()
class ProductPrice {
  String? currencyCode;
  int? productId;
  String? productName;
  int? standardProductPriceId;
  int? currencyExchangeRateId;
  int? isStandard;
  int? useStandardPriceList;
  double? listPrice;
  String? currencyName;
  String? productCode;
  int? id;
  int? status;

  ProductPrice(
      {this.currencyCode,
      this.productId,
      this.productName,
      this.standardProductPriceId,
      this.currencyExchangeRateId,
      this.isStandard,
      this.useStandardPriceList,
      this.listPrice,
      this.currencyName,
      this.productCode,
      this.id,
      this.status});

  factory ProductPrice.fromJson(Map<String, dynamic> json) =>
      _$ProductPriceFromJson(json);

  Map<String, dynamic> toJson() => _$ProductPriceToJson(this);

  bool isCompare(String searchText) {
    return (productName ?? '')
            .toLowerCase()
            .contains(searchText.toLowerCase()) ||
        (productCode ?? '').toLowerCase().contains(searchText.toLowerCase());
  }
}
