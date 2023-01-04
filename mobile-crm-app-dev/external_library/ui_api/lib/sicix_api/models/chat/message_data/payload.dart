import 'package:json_annotation/json_annotation.dart';

import '../../base_models.dart';
import 'message_item.dart';

part 'payload.g.dart';

@JsonSerializable()
class Payload extends BaseModels {
  List<MessageItem>? content;

  Payload(this.content);

  factory Payload.fromJson(Map<String, dynamic> json) {
    return _$PayloadFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() => _$PayloadToJson(this);
}
