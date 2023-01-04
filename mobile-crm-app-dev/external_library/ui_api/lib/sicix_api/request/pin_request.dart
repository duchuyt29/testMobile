import 'package:json_annotation/json_annotation.dart';

part 'pin_request.g.dart';

@JsonSerializable()
class PinRequest {
  final String msgId;
  final String type;

  PinRequest(this.msgId, this.type);

  factory PinRequest.fromJson(Map<String, dynamic> json) =>
      _$PinRequestFromJson(json);

  Map<String, dynamic> toJson() => _$PinRequestToJson(this);
}
