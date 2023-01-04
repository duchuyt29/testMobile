import 'package:json_annotation/json_annotation.dart';

part 'product_request.g.dart';

@JsonSerializable()
class ProductRequest {
  final int? id;
  final String? productCode;
  final String? productName;
  final int? productFamilyId;
  final String? productFamilyName;
  final String? description;
  final int? status;

  ProductRequest({
    this.id,
    this.productCode,
    this.productName,
    this.productFamilyId,
    this.productFamilyName,
    this.description,
    this.status,
  });

  factory ProductRequest.fromJson(Map<String, dynamic> json) =>
      _$ProductRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ProductRequestToJson(this);
}
