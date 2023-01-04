import 'package:json_annotation/json_annotation.dart';

import '../conversation/current.dart';
import 'last_message.dart';
import 'payload.dart';

part 'search_message_data.g.dart';

@JsonSerializable()
class SearchMessageData {
  Current? current;
  Payload? payload;
  LastMessage? conversation;

  SearchMessageData({this.current, this.payload, this.conversation});

  factory SearchMessageData.fromJson(Map<String, dynamic> json) {
    return _$SearchMessageDataFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SearchMessageDataToJson(this);
}
