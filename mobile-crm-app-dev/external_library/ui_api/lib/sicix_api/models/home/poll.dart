import 'package:get/get.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:sicix/shared/utils/date_util.dart';

import 'answer.dart';

part 'poll.g.dart';

@JsonSerializable()
class Poll {
  final int? multiChoice;
  List<int>? userAnswer;
  final List<Answer>? answers;
  final int? id;
  final int? refId;
  final String? state;
  final String? title;
  final DateTime? deadline;

  Poll({
    this.multiChoice,
    this.userAnswer,
    this.answers,
    this.id,
    this.refId,
    this.state,
    this.title,
    this.deadline,
  });

  factory Poll.fromJson(Map<String, dynamic> json) => _$PollFromJson(json);

  Map<String, dynamic> toJson() => _$PollToJson(this);

  int getTotelVote() {
    return answers?.fold(
            0,
            (previousValue, answer) =>
                (previousValue ?? 0) + (answer.count ?? 0)) ??
        0;
  }

  bool isSeleted(Answer answer) {
    return userAnswer?.contains(answer.id) ?? false;
  }

  String getDeadline() {
    return DateUtil.formatDatetimeToString(deadline,
        type: DateUtil.DATETIME_TYPE);
  }

  void updateVote(Answer answer) {
    if (answer.id == null) {
      return;
    }
    if (userAnswer?.contains(answer.id) ?? false) {
      userAnswer?.remove(answer.id);
      answer.decreaseCount();
    } else if (multiChoice == 0) {
      if (userAnswer?.isNotEmpty ?? false) {
        answers
            ?.firstWhereOrNull(
                (answer) => userAnswer?.contains(answer.id) ?? false)
            ?.decreaseCount();
        userAnswer = [answer.id!];
        answer.increaseCount();
      } else if (answer.id != null) {
        userAnswer = [answer.id!];
        answer.increaseCount();
      }
    } else if (answer.id != null) {
      if (userAnswer == null) {
        userAnswer = [answer.id!];
      } else {
        userAnswer!.add(answer.id!);
      }
      answer.increaseCount();
    }
  }
}
