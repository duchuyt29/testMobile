import 'package:json_annotation/json_annotation.dart';

import '../../models/chat/message_pin/message_pin.dart';
import '../base_response.dart';

part 'message_pin_response.g.dart';

@JsonSerializable()
class MessagePinResponse extends BaseResponse {
  MessagePins? data;

  MessagePinResponse({this.data}) : super(false);

  factory MessagePinResponse.fromJson(Map<String, dynamic> json) =>
      _$MessagePinResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$MessagePinResponseToJson(this);
}
