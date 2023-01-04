// import 'dart:convert';

// import 'package:json_annotation/json_annotation.dart';

// import '../message_content/message_content.dart';
// import 'message_ws_metadata.dart';

// part 'message_ws_text.g.dart';

// @JsonSerializable()
// class MessageWSText {
//   String? id;
//   int? convId;
//   String? content;
//   String? createBy;

//   MessageWSText({this.id, this.convId, this.content, this.createBy});

//   factory MessageWSText.fromJson(Map<String, dynamic> json) {
//     return _$MessageWSTextFromJson(json);
//   }

//   Map<String, dynamic> toJson() => _$MessageWSTextToJson(this);

//   static dynamic _payloadToJson(MessageWSMetadata? payload) {
//     return jsonDecode(jsonEncode(payload));
//   }
// }
