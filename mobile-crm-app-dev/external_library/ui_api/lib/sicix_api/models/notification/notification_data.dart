import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'notification_data.g.dart';

@JsonSerializable()
class NotificationData {
  String? event;
  String? id;

  @JsonKey(fromJson: _convertParams)
  List<String>? params;

  NotificationData({this.event, this.id, this.params});

  factory NotificationData.fromJson(Map<String, dynamic> json) {
    return _$NotificationDataFromJson(json);
  }

  Map<String, dynamic> toJson() => _$NotificationDataToJson(this);
}

List<String>? _convertParams(dynamic params) {
  if (params == null) {
    return null;
  } else if (params is List<String>) {
    return params;
  } else if (params is String) {
    return jsonDecode(params).cast<String>();
  } else {
    return null;
  }
}
