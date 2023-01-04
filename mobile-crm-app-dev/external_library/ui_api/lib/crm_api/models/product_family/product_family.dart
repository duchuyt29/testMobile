import 'package:json_annotation/json_annotation.dart';

part 'product_family.g.dart';

@JsonSerializable()
class ProductFamily {
  ProductFamily(
      {this.id,
      this.productFamilyName,
      this.productFamilyCode,
      this.description,
      this.createDate,
      this.modifiedDate,
      this.status,
      this.createBy,
      this.updateBy});

  int? id;
  String? productFamilyName;
  String? productFamilyCode;
  String? description;
  DateTime? createDate;
  DateTime? modifiedDate;
  int? status;
  String? createBy;
  String? updateBy;

  factory ProductFamily.fromJson(Map<String, dynamic> json) =>
      _$ProductFamilyFromJson(json);

  Map<String, dynamic> toJson() => _$ProductFamilyToJson(this);
}
