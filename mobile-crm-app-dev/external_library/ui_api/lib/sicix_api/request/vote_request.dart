import 'package:json_annotation/json_annotation.dart';

part 'vote_request.g.dart';

@JsonSerializable()
class VoteRequest {
  @JsonKey(name: 'id')
  final int pollId;
  final List<int> answerIds;

  VoteRequest(this.pollId, this.answerIds);

  factory VoteRequest.fromJson(Map<String, dynamic> json) =>
      _$VoteRequestFromJson(json);

  Map<String, dynamic> toJson() => _$VoteRequestToJson(this);
}
