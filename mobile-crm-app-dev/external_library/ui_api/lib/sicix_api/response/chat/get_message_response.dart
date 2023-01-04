import 'package:json_annotation/json_annotation.dart';

import '../../models/chat/message_data/get_message_data.dart';
import '../base_response.dart';

part 'get_message_response.g.dart';

@JsonSerializable()
class GetMessageResponse extends BaseResponse {
  GetMessageData? data;

  GetMessageResponse({this.data}) : super(false);

  @override
  factory GetMessageResponse.fromJson(Map<String, dynamic> json) =>
      _$GetMessageResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$GetMessageResponseToJson(this);
}
