import 'package:json_annotation/json_annotation.dart';

part 'reaction_request.g.dart';

@JsonSerializable()
class ReactionRequest {
  final String id;
  final String type;

  ReactionRequest(this.id, this.type);

  factory ReactionRequest.fromJson(Map<String, dynamic> json) =>
      _$ReactionRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ReactionRequestToJson(this);
}
