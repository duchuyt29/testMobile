import 'package:json_annotation/json_annotation.dart';

part 'activity_checkin_request.g.dart';

@JsonSerializable()
class ActivityCheckinRequest {
  int? id;
  double? latitude;
  double? longitude;

  ActivityCheckinRequest({
    this.id,
    this.latitude = 0,
    this.longitude = 0,
  });

  factory ActivityCheckinRequest.fromJson(Map<String, dynamic> json) =>
      _$ActivityCheckinRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ActivityCheckinRequestToJson(this);
}
