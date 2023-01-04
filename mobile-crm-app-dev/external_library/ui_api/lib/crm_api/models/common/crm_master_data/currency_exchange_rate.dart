import 'package:json_annotation/json_annotation.dart';

part 'currency_exchange_rate.g.dart';

@JsonSerializable()
class CurrencyExchangeRate {
  int? id;
  int? isDefault;
  double? conversionRate;
  String? currencyName;
  String? currencyCode;
  int? currencyId;
  int? decimalPlace;

  CurrencyExchangeRate(
      {this.id,
      this.isDefault,
      this.conversionRate,
      this.currencyName,
      this.currencyCode,
      this.currencyId,
      this.decimalPlace});

  factory CurrencyExchangeRate.fromJson(Map<String, dynamic> json) {
    return _$CurrencyExchangeRateFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CurrencyExchangeRateToJson(this);

  bool isCompare(String searchText) {
    return currencyName!.toLowerCase().contains(searchText.toLowerCase()) ||
        currencyCode!.toLowerCase().contains(searchText.toLowerCase());
  }
}
