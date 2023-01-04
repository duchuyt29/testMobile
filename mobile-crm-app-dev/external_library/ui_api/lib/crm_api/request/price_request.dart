import 'package:json_annotation/json_annotation.dart';

part 'price_request.g.dart';

@JsonSerializable()
class PriceRequest {
  final int? id;
  final int? isActive;
  final int? isStandard;
  final int? status;
  final String? priceCode;
  final String? priceName;
  final String? description;

  PriceRequest({
    this.id,
    this.isActive,
    this.isStandard,
    this.status,
    this.priceCode,
    this.priceName,
    this.description,
  });

  factory PriceRequest.fromJson(Map<String, dynamic> json) =>
      _$PriceRequestFromJson(json);

  Map<String, dynamic> toJson() => _$PriceRequestToJson(this);
}
