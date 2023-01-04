import 'package:get/get.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:sicix/resource/assets_constant/icon_constants.dart';

part 'reaction_model.g.dart';

enum Reaction { like, love, care, haha, sad, wow, angry }

extension ReactionExtension on Reaction {
  String get key {
    switch (this) {
      case Reaction.like:
        return 'like';
      case Reaction.angry:
        return 'angry';
      case Reaction.love:
        return 'love';
      case Reaction.wow:
        return 'wow';
      case Reaction.sad:
        return 'sad';
      case Reaction.care:
        return 'care';
      case Reaction.haha:
        return 'haha';
    }
  }

  String get avatarUrl {
    switch (this) {
      case Reaction.like:
        return IconConstants.icLike;
      case Reaction.angry:
        return IconConstants.icAngry;
      case Reaction.love:
        return IconConstants.icLove;
      case Reaction.wow:
        return IconConstants.icWow;
      case Reaction.sad:
        return IconConstants.icSad;
      case Reaction.care:
        return IconConstants.icCare;
      case Reaction.haha:
        return IconConstants.icHaha;
    }
  }

  int get tabIndex {
    switch (this) {
      case Reaction.like:
        return 1;
      case Reaction.angry:
        return 2;
      case Reaction.love:
        return 3;
      case Reaction.wow:
        return 4;
      case Reaction.sad:
        return 5;
      case Reaction.care:
        return 6;
      case Reaction.haha:
        return 7;
    }
  }
}

@JsonSerializable()
class ReactionModel {
  String? userReaction;
  int? love;
  int? haha;
  int? like;
  int? sad;
  int? angry;
  int? wow;
  int? care;

  ReactionModel(
      {this.love,
      this.userReaction,
      this.haha,
      this.like,
      this.sad,
      this.angry,
      this.wow,
      this.care});

  factory ReactionModel.fromJson(Map<String, dynamic> json) {
    return _$ReactionModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ReactionModelToJson(this);

  void removeReaction(String? value) {
    final reaction = Reaction.values.firstWhereOrNull((e) => e.key == value);
    switch (reaction) {
      case Reaction.like:
        like = (like ?? 0) - 1;
        break;
      case Reaction.angry:
        angry = (angry ?? 0) - 1;
        break;
      case Reaction.love:
        love = (love ?? 0) - 1;
        break;
      case Reaction.wow:
        wow = (wow ?? 0) - 1;
        break;
      case Reaction.sad:
        sad = (sad ?? 0) - 1;
        break;
      case Reaction.care:
        care = (care ?? 0) - 1;
        break;
      case Reaction.haha:
        haha = (haha ?? 0) - 1;
        break;
      default:
        break;
    }
  }

  void addReaction(String? value) {
    final reaction = Reaction.values.firstWhereOrNull((e) => e.key == value);
    switch (reaction) {
      case Reaction.like:
        like = (like ?? 0) + 1;
        break;
      case Reaction.angry:
        angry = (angry ?? 0) + 1;
        break;
      case Reaction.love:
        love = (love ?? 0) + 1;
        break;
      case Reaction.wow:
        wow = (wow ?? 0) + 1;
        break;
      case Reaction.sad:
        sad = (sad ?? 0) + 1;
        break;
      case Reaction.care:
        care = (care ?? 0) + 1;
        break;
      case Reaction.haha:
        haha = (haha ?? 0) + 1;
        break;
      default:
        break;
    }
  }

  int get reactionCount {
    var count = 0;
    if ((like ?? 0) > 0) {
      count += 1;
    }
    if ((angry ?? 0) > 0) {
      count += 1;
    }
    if ((love ?? 0) > 0) {
      count += 1;
    }
    if ((wow ?? 0) > 0) {
      count += 1;
    }
    if ((sad ?? 0) > 0) {
      count += 1;
    }
    if ((care ?? 0) > 0) {
      count += 1;
    }
    if ((haha ?? 0) > 0) {
      count += 1;
    }
    return count;
  }

  int get totalReaction {
    return (like ?? 0) +
        (angry ?? 0) +
        (love ?? 0) +
        (wow ?? 0) +
        (sad ?? 0) +
        (care ?? 0) +
        (haha ?? 0);
  }
}
