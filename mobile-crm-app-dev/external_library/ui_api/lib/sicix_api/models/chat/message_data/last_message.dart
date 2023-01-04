import 'package:json_annotation/json_annotation.dart';

part 'last_message.g.dart';

@JsonSerializable()
class LastMessage {
  String? lastMessage;

  LastMessage({this.lastMessage});

  factory LastMessage.fromJson(Map<String, dynamic> json) {
    return _$LastMessageFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LastMessageToJson(this);
}
