import 'package:json_annotation/json_annotation.dart';

part 'price.g.dart';

@JsonSerializable()
class Price {
  Price({
    this.id,
    this.isActive,
    this.status,
    this.isStandard,
    this.priceCode,
    this.priceName,
    this.createDate,
    this.createBy,
    this.modifiedDate,
    this.updateBy,
    this.description,
  });

  final int? id;
  final int? isActive;
  final int? isStandard;
  final int? status;
  final String? priceCode;
  final String? priceName;
  final String? description;
  final String? createDate;
  final String? createBy;
  final String? modifiedDate;
  final String? updateBy;

  factory Price.fromJson(Map<String, dynamic> json) => _$PriceFromJson(json);

  Map<String, dynamic> toJson() => _$PriceToJson(this);
}
