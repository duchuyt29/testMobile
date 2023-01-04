import 'package:json_annotation/json_annotation.dart';

import '../../models/attachment/attachment_item.dart';
import '../base_response.dart';

part 'upload_file_response.g.dart';

@JsonSerializable()
class UploadFileResponse extends BaseResponse {
  List<AttachmentItem>? data;

  UploadFileResponse(this.data) : super(false);

  factory UploadFileResponse.fromJson(Map<String, dynamic> json) =>
      _$UploadFileResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$UploadFileResponseToJson(this);
}
