import 'package:json_annotation/json_annotation.dart';

import '../../models/activity/activity_order.dart';
import '../base_response.dart';

part 'activity_order_response.g.dart';

@JsonSerializable()
class ActivityOrderResponse extends BaseResponse {
  @JsonKey(name: 'data')
  List<ActivityOrder>? data;
  ActivityOrderResponse({this.data}) : super(false);

  factory ActivityOrderResponse.fromJson(Map<String, dynamic> json) =>
      _$ActivityOrderResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ActivityOrderResponseToJson(this);
}
