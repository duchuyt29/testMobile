import 'package:json_annotation/json_annotation.dart';

part 'current.g.dart';

@JsonSerializable()
class Current {
  int? unread;
  String? lastMessage;
  int? active;
  DateTime? lastRead;

  Current({this.unread, this.lastMessage, this.active, this.lastRead});

  factory Current.fromJson(Map<String, dynamic> json) {
    return _$CurrentFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CurrentToJson(this);

  String getUnread() {
    if (unread == null || unread! <= 0) {
      return '';
    } else if (unread! <= 5) {
      return ' $unread ';
    } else {
      return '5+';
    }
  }
}
