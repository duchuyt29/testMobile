import 'package:json_annotation/json_annotation.dart';

import '../base_models.dart';
import 'user.dart';

part 'user_reaction.g.dart';

@JsonSerializable()
class UserReaction {
  final String? createDate;
  @JsonKey(name: 'userId')
  final User? user;
  final String? type;

  // Bao gồm view,like,love,care,haha,sad,wow,angry
  const UserReaction({
    this.createDate,
    this.user,
    this.type,
  });

  factory UserReaction.fromJson(Map<String, dynamic> json) =>
      _$UserReactionFromJson(json);

  Map<String, dynamic> toJson() => _$UserReactionToJson(this);
}

@JsonSerializable()
class UserViewerData extends BaseModels {
  @JsonKey(defaultValue: [])
  List<UserReaction> content;

  UserViewerData(this.content);

  factory UserViewerData.fromJson(Map<String, dynamic> json) =>
      _$UserViewerDataFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$UserViewerDataToJson(this);
}
