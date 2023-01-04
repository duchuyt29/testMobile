import 'package:json_annotation/json_annotation.dart';

part 'conversation_created.g.dart';

@JsonSerializable()
class ConversationCreated {
  String? name;
  int? id;
  String? type;
  @JsonKey(name: 'msg_type')
  String? msgType;
  @JsonKey(name: 'msg_by')
  String? msgBy;
  @JsonKey(name: 'msg_content')
  String? msgContent;
  String? partner;
  @JsonKey(name: 'modified_date')
  String? modifiedDate;
  String? avatar;
  dynamic config;

  ConversationCreated({
    this.name,
    this.id,
    this.type,
    this.msgType,
    this.msgBy,
    this.msgContent,
    this.partner,
    this.modifiedDate,
    this.avatar,
    this.config,
  });

  factory ConversationCreated.fromJson(Map<String, dynamic> json) {
    return _$ConversationCreatedFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ConversationCreatedToJson(this);
}
