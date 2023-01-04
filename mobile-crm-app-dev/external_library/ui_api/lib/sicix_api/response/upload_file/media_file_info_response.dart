import 'package:json_annotation/json_annotation.dart';

import '../../models/media_file/media_file.dart';
import '../base_response.dart';

part 'media_file_info_response.g.dart';

@JsonSerializable()
class MediaFileInfoResponse extends BaseResponse {
  MediaFile? data;

  MediaFileInfoResponse(this.data) : super(false);

  factory MediaFileInfoResponse.fromJson(Map<String, dynamic> json) =>
      _$MediaFileInfoResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$MediaFileInfoResponseToJson(this);
}
