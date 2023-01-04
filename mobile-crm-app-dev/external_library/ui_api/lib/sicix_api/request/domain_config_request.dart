import 'package:json_annotation/json_annotation.dart';

part 'domain_config_request.g.dart';

@JsonSerializable()
class DomainConfigRequest {
  final String domain;

  DomainConfigRequest(this.domain);

  factory DomainConfigRequest.fromJson(Map<String, dynamic> json) =>
      _$DomainConfigRequestFromJson(json);

  Map<String, dynamic> toJson() => _$DomainConfigRequestToJson(this);
}
