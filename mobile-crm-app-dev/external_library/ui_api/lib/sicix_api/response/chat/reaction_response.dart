import 'package:json_annotation/json_annotation.dart';

import '../../models/common/reaction_model.dart';
import '../base_response.dart';

part 'reaction_response.g.dart';

@JsonSerializable()
class ReactionResponse extends BaseResponse {
  ReactionModel? data;

  ReactionResponse({this.data}) : super(false);

  factory ReactionResponse.fromJson(Map<String, dynamic> json) =>
      _$ReactionResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ReactionResponseToJson(this);
}
