import 'package:json_annotation/json_annotation.dart';

import '../../models/product/product.dart';
import '../base_response.dart';

part 'products_response.g.dart';

@JsonSerializable()
class ProductsResponse extends BaseResponse {
  final List<Product>? data;

  ProductsResponse({this.data}) : super(false);

  factory ProductsResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductsResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ProductsResponseToJson(this);
}
