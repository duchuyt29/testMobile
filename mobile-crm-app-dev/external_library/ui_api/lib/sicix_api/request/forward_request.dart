import 'package:json_annotation/json_annotation.dart';

part 'forward_request.g.dart';

@JsonSerializable()
class ForwardRequest {
  final String type;
  final int to;
  final String content;

  ForwardRequest(
    this.type,
    this.to,
    this.content,
  );

  factory ForwardRequest.fromJson(Map<String, dynamic> json) =>
      _$ForwardRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ForwardRequestToJson(this);
}
