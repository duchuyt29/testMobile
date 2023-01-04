import 'package:json_annotation/json_annotation.dart';

part 'total_unread.g.dart';

@JsonSerializable()
class TotalUnread {
  int? total;

  TotalUnread({this.total});

  factory TotalUnread.fromJson(Map<String, dynamic> json) {
    return _$TotalUnreadFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TotalUnreadToJson(this);
}
