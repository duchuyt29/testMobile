import 'package:json_annotation/json_annotation.dart';

part 'message_user.g.dart';

@JsonSerializable()
class MessageUser {
  String? role;
  String? name;
  String? id;
  bool? partnerOnline;

  MessageUser({this.role, this.name, this.id, this.partnerOnline});

  factory MessageUser.fromJson(Map<String, dynamic> json) {
    return _$MessageUserFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MessageUserToJson(this);
}
