import 'package:json_annotation/json_annotation.dart';

part 'avatar_request.g.dart';

@JsonSerializable()
class AvatarRequest {
  @JsonKey(name: 'avatar')
  final String? avatarId;

  AvatarRequest(this.avatarId);

  factory AvatarRequest.fromJson(Map<String, dynamic> json) =>
      _$AvatarRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AvatarRequestToJson(this);
}
