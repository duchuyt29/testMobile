import 'package:json_annotation/json_annotation.dart';

import '../conversation/current.dart';
import 'last_message.dart';
import 'message_item.dart';

part 'get_message_data.g.dart';

@JsonSerializable()
class GetMessageData {
  Current? current;
  List<MessageItem>? payload;
  LastMessage? conversation;

  GetMessageData({this.current, this.payload, this.conversation});

  factory GetMessageData.fromJson(Map<String, dynamic> json) {
    return _$GetMessageDataFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetMessageDataToJson(this);
}
