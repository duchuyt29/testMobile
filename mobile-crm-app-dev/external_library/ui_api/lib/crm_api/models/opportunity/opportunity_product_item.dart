import 'package:json_annotation/json_annotation.dart';
import 'package:sicix/data/app_data_global.dart';

part 'opportunity_product_item.g.dart';

@JsonSerializable()
class OpportunityProductItem {
  DateTime? createDate;
  DateTime? modifiedDate;
  int? status;
  String? createBy;
  String? updateBy;
  int? id;
  int? opportunityId;
  int? productPriceId;
  int? productId;
  String? productCode;
  String? productName;
  int? currencyExchangeRateId;
  double? quantity;
  double? salePrice;
  double? listPrice;

  OpportunityProductItem(
      {this.createDate,
      this.modifiedDate,
      this.status,
      this.createBy,
      this.updateBy,
      this.id,
      this.opportunityId,
      this.productPriceId,
      this.productId,
      this.productCode,
      this.productName,
      this.currencyExchangeRateId,
      this.quantity,
      this.salePrice});

  factory OpportunityProductItem.fromJson(Map<String, dynamic> json) =>
      _$OpportunityProductItemFromJson(json);

  Map<String, dynamic> toJson() => _$OpportunityProductItemToJson(this);

  String getTotalAmount() {
    return '${(quantity! * salePrice!.toInt()).toInt()} ${AppDataGlobal.crmMasterData!.listCurrencyExchangeRate!.firstWhere((element) => element.id == currencyExchangeRateId).currencyCode!} ';
  }

  bool isSalePriceSmallListPrice() {
    return salePrice! < listPrice!;
  }
}
