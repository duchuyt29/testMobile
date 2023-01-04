import 'package:json_annotation/json_annotation.dart';

import '../../models/chat/message_attach_file/message_attach_file.dart';
import '../base_response.dart';

part 'message_attach_file_response.g.dart';

@JsonSerializable()
class MessageAttachFileResponse extends BaseResponse {
  MessageAttachFiles? data;

  MessageAttachFileResponse({this.data}) : super(false);

  factory MessageAttachFileResponse.fromJson(Map<String, dynamic> json) =>
      _$MessageAttachFileResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$MessageAttachFileResponseToJson(this);
}
