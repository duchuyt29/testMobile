import 'dart:math';

import 'package:json_annotation/json_annotation.dart';

part 'answer.g.dart';

@JsonSerializable()
class Answer {
  final String? title;
  int? count;
  final int? id;

  Answer({
    this.title,
    this.count,
    this.id,
  });

  factory Answer.fromJson(Map<String, dynamic> json) => _$AnswerFromJson(json);

  Map<String, dynamic> toJson() => _$AnswerToJson(this);

  void increaseCount() {
    if (count == null) {
      count = 1;
    } else {
      count = count! + 1;
    }
  }

  void decreaseCount() {
    if (count == null) {
      count = 0;
    } else {
      count = max(count! - 1, 0);
    }
  }
}
