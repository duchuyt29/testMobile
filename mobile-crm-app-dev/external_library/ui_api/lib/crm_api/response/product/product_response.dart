import 'package:json_annotation/json_annotation.dart';

import '../../models/product/product.dart';
import '../base_response.dart';

part 'product_response.g.dart';

@JsonSerializable()
class ProductResponse extends BaseResponse {
  @JsonKey(name: 'data')
  Product? data;
  ProductResponse({this.data}) : super(false);
  factory ProductResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductResponseFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$ProductResponseToJson(this);
}
