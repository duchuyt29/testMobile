import 'package:json_annotation/json_annotation.dart';

part 'activity_qoute.g.dart';

@JsonSerializable(includeIfNull: false)
class ActivityQoute {
  int? accountId;
  int? id;
  String? quoteName;
  String? quoteNumber;
  double? totalPrice;

  ActivityQoute({
    this.accountId,
    this.id,
    this.quoteName,
    this.quoteNumber,
    this.totalPrice,
  });

  factory ActivityQoute.fromJson(Map<String, dynamic> json) =>
      _$ActivityQouteFromJson(json);

  Map<String, dynamic> toJson() => _$ActivityQouteToJson(this);
}
