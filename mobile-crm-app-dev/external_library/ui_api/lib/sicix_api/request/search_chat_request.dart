import 'package:json_annotation/json_annotation.dart';

part 'search_chat_request.g.dart';

@JsonSerializable(includeIfNull: false)
class SearchChatRequest {
  static const String LOAD_BEFORE = 'before';
  static const String LOAD_AFTER = 'after';

  final String? search;

  SearchChatRequest({this.search});

  factory SearchChatRequest.fromJson(Map<String, dynamic> json) =>
      _$SearchChatRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SearchChatRequestToJson(this);
}
