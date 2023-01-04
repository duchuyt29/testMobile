import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'message_ws_active.g.dart';

@JsonSerializable()
class MessageWSActive {
  String? cmd;
  int? convId;
  // @JsonKey(toJson: _payloadToJson)
  MessageWSPayload? payload;

  MessageWSActive({this.cmd, this.convId, this.payload});

  factory MessageWSActive.active(int? convId) {
    return MessageWSActive(
      cmd: 'event',
      convId: convId,
      payload: MessageWSPayload(type: 'ACTIVE'),
    );
  }

  factory MessageWSActive.inactive(int? convId) {
    return MessageWSActive(
      cmd: 'event',
      convId: convId,
      payload: MessageWSPayload(type: 'INACTIVE'),
    );
  }

  factory MessageWSActive.fromJson(Map<String, dynamic> json) {
    return _$MessageWSActiveFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MessageWSActiveToJson(this);

  static dynamic _payloadToJson(MessageWSPayload? payload) {
    return jsonDecode(jsonEncode(payload));
  }
}

@JsonSerializable()
class MessageWSPayload {
  String? type;

  MessageWSPayload({this.type});

  factory MessageWSPayload.fromJson(Map<String, dynamic> json) {
    return _$MessageWSPayloadFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MessageWSPayloadToJson(this);
}
