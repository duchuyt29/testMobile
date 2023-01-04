import 'package:json_annotation/json_annotation.dart';

part 'activity_order.g.dart';

@JsonSerializable(includeIfNull: false)
class ActivityOrder {
  int? accountId;
  int? id;
  String? orderNumber;

  ActivityOrder({
    this.accountId,
    this.id,
    this.orderNumber,
  });

  factory ActivityOrder.fromJson(Map<String, dynamic> json) =>
      _$ActivityOrderFromJson(json);

  Map<String, dynamic> toJson() => _$ActivityOrderToJson(this);
}
