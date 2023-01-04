import 'package:json_annotation/json_annotation.dart';

part 'activity_opp.g.dart';

@JsonSerializable(includeIfNull: false)
class ActivityOpp {
  int? accountId;
  int? id;
  String? opportunityName;
  String? opportunityCode;
  int? currencyExchangeRateId;

  ActivityOpp({
    this.accountId,
    this.id,
    this.opportunityName,
    this.opportunityCode,
    this.currencyExchangeRateId,
  });

  factory ActivityOpp.fromJson(Map<String, dynamic> json) =>
      _$ActivityOppFromJson(json);

  Map<String, dynamic> toJson() => _$ActivityOppToJson(this);
}
