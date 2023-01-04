import 'package:json_annotation/json_annotation.dart';

import '../../models/product_family/product_family.dart';
import '../base_response.dart';

part 'product_family_response.g.dart';

@JsonSerializable()
class ProductFamilyResponse extends BaseResponse {
  @JsonKey(name: 'data')
  ProductFamily? data;

  ProductFamilyResponse({this.data}) : super(false);

  factory ProductFamilyResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductFamilyResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ProductFamilyResponseToJson(this);
}
