import 'package:json_annotation/json_annotation.dart';

part 'name_request.g.dart';

@JsonSerializable()
class NameRequest {
  final String name;

  NameRequest(this.name);

  factory NameRequest.fromJson(Map<String, dynamic> json) =>
      _$NameRequestFromJson(json);

  Map<String, dynamic> toJson() => _$NameRequestToJson(this);
}
