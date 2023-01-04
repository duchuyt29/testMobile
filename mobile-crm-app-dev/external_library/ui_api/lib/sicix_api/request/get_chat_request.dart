import 'package:json_annotation/json_annotation.dart';

part 'get_chat_request.g.dart';

@JsonSerializable()
class GetChatRequest {
  static const String LOAD_BEFORE = 'before';
  static const String LOAD_AFTER = 'after';

  final String? latestDate;
  final String? load;

  GetChatRequest({this.latestDate, this.load});

  factory GetChatRequest.fromJson(Map<String, dynamic> json) =>
      _$GetChatRequestFromJson(json);

  Map<String, dynamic> toJson() => _$GetChatRequestToJson(this);
}
