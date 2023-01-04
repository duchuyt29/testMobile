import 'package:json_annotation/json_annotation.dart';

part 'price.g.dart';

@JsonSerializable()
class Price {
  int? isStandard;
  int? id;
  String? priceName;
  String? priceCode;
  String? description;
  int? isActive;

  Price({
    this.isStandard,
    this.id,
    this.priceName,
    this.priceCode,
    this.description,
    this.isActive,
  });

  factory Price.fromJson(Map<String, dynamic> json) {
    return _$PriceFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PriceToJson(this);
}
