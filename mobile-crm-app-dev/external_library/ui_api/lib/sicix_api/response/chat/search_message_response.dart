import 'package:json_annotation/json_annotation.dart';

import '../../models/chat/message_data/search_message_data.dart';
import '../base_response.dart';

part 'search_message_response.g.dart';

@JsonSerializable()
class SearchMessageResponse extends BaseResponse {
  SearchMessageData? data;

  SearchMessageResponse({this.data}) : super(false);

  factory SearchMessageResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchMessageResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$SearchMessageResponseToJson(this);
}
