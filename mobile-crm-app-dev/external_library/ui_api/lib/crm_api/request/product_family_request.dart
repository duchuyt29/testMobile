import 'package:json_annotation/json_annotation.dart';

part 'product_family_request.g.dart';

@JsonSerializable()
class ProductFamilyRequest {
  final int? id;
  final String? productFamilyName;
  final String? productFamilyCode;
  final String? description;
  final int? status;

  ProductFamilyRequest(
      {this.id,
      this.productFamilyName,
      this.productFamilyCode,
      this.description,
      this.status});

  factory ProductFamilyRequest.fromJson(Map<String, dynamic> json) =>
      _$ProductFamilyRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ProductFamilyRequestToJson(this);
}
