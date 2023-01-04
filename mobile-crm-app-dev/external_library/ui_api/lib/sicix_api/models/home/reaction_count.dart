import 'package:json_annotation/json_annotation.dart';

import 'user_reaction.dart';

part 'reaction_count.g.dart';

@JsonSerializable()
class ReactionCount {
  ReactionCount({
    this.code,
    this.success,
    this.title,
    this.message,
    this.data,
  });

  String? code;
  bool? success;
  String? title;
  String? message;
  List<UserReaction>? data;

  factory ReactionCount.fromJson(Map<String, dynamic> json) =>
      _$ReactionCountFromJson(json);

  Map<String, dynamic> toJson() => _$ReactionCountToJson(this);
}
