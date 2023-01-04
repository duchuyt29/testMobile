import 'package:json_annotation/json_annotation.dart';

import '../../models/attachment/attachment_item.dart';
import '../base_response.dart';

part 'attachment_post_response.g.dart';

@JsonSerializable()
class AttachmentPostResponse extends BaseResponse {
  List<AttachmentItem>? data;

  AttachmentPostResponse({this.data}) : super(false);

  factory AttachmentPostResponse.fromJson(Map<String, dynamic> json) =>
      _$AttachmentPostResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$AttachmentPostResponseToJson(this);
}
