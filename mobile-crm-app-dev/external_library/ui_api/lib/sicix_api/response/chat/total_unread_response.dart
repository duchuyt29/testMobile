import 'package:json_annotation/json_annotation.dart';

import '../../models/chat/total_unread.dart';
import '../base_response.dart';

part 'total_unread_response.g.dart';

@JsonSerializable()
class TotalUnreadResponse extends BaseResponse {
  TotalUnread? data;

  TotalUnreadResponse({this.data}) : super(false);

  factory TotalUnreadResponse.fromJson(Map<String, dynamic> json) =>
      _$TotalUnreadResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TotalUnreadResponseToJson(this);
}
