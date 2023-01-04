import 'package:json_annotation/json_annotation.dart';
import 'package:tiengviet/tiengviet.dart';

part 'product.g.dart';

@JsonSerializable(includeIfNull: false)
class Product {
  final int? id;
  int? productId;
  int? status;
  final String? productCode;
  final String? productName;
  final int? productFamilyId;
  final String? productFamilyName;
  final String? description;
  final String? createBy;
  final String? updateBy;
  final String? createDate;
  final String? modifiedDate;

  Product({
    this.id,
    this.productCode,
    this.productName,
    this.productFamilyId,
    this.productFamilyName,
    this.description,
    this.status,
    this.createBy,
    this.updateBy,
    this.createDate,
    this.modifiedDate,
    this.productId,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    final product = _$ProductFromJson(json);
    product.productId = product.id;
    return product;
  }

  Map<String, dynamic> toJson() => _$ProductToJson(this);

  String getTitle() {
    return '$productCode - $productName';
  }

  bool isCompare(String searchText) {
    return TiengViet.parse(productName ?? '')
            .toLowerCase()
            .contains(TiengViet.parse(searchText).toLowerCase()) ||
        TiengViet.parse(productCode ?? '')
            .toLowerCase()
            .contains(TiengViet.parse(searchText).toLowerCase());
  }
}
