import 'package:json_annotation/json_annotation.dart';

import '../../models/notification/notification_model.dart';
import '../base_response.dart';

part 'notification_response.g.dart';

@JsonSerializable()
class NotificationResponse extends BaseResponse {
  NotificationModels? data;

  NotificationResponse(this.data) : super(false);

  factory NotificationResponse.fromJson(Map<String, dynamic> json) =>
      _$NotificationResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$NotificationResponseToJson(this);
}
